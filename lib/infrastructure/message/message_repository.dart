import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/conversation.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:mobilite_moderne/DOMAIN/message/message_failure.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'conversation_dtos.dart';
import 'message_dtos.dart';

abstract class IMessageRepository {
  Stream<Either<MessageFailure, List<Message>>> watch();
  Future<Either<MessageFailure, Unit>> create(Message message);
  Future<Either<MessageFailure, Unit>> update(Message message);
  Future<Either<MessageFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: IMessageRepository)
class MessageRepository implements IMessageRepository {
  final FirebaseFirestore _firestore;
  final AuthRepository _authRepository;
  final FirebaseStorage _storage;

  MessageRepository(
    this._firestore,
    this._authRepository,
    this._storage,
  );

  @override
  Future<Either<MessageFailure, Unit>> create(Message message) async {
    try {
      //Donnée de l'utilisateur
      UserData? user = await _getUser();
      final uid = user?.id.getOrCrash();
      if (uid == null) return left(const MessageFailure.noUserConnected());
      final String? pathImage = message.imageSend != null ? 'message/$uid/${message.imageSend!.name}' : null;

      //S'il y'a une image, on l'ajoute
      if (message.imageSend != null) {
        final TaskSnapshot result =
            await _storage.ref().child(pathImage!).putFile(File(message.imageSend!.path));
      }

      //On crée le méchant message
      final messageDTO = MessageDTO.fromDomain(message, user?.id, pathImage);
      await _firestore.messageCollection
          .doc('$uid')
          .collection('discussion')
          .doc('${messageDTO.id}')
          .set(messageDTO.toJson());

      //Actualisation de la conversation
      final conversationDTO = ConversationDTO.fromDomain(Conversation(
        id: UniqueId.fromUniqueString(uid),
        name: user?.userName ?? Nom('undefined'),
        dateLastMessage: message.date,
        isRead: false,
      ));
      await _firestore.messageCollection.doc('$uid').set(conversationDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const MessageFailure.insufficientPermission());
      } else if (e.message!
          .contains('The caller does not have permission to execute the specified operation')) {
        return left(const MessageFailure.insufficientPermission());
      } else {
        return left(const MessageFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<MessageFailure, Unit>> delete(UniqueId id) async {
    try {
      //UID de l'utilisateur
      final uid = (await _getUidUser())?.getOrCrash();
      if (uid == null) return left(const MessageFailure.noUserConnected());

      await _firestore.messageCollection.doc('$uid').collection('discussion').doc('$id').delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const MessageFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const MessageFailure.unableToUpdate());
      } else {
        return left(const MessageFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<MessageFailure, Unit>> update(Message message) async {
    try {
      //UID de l'utilisateur
      final uid = (await _getUidUser());
      if (uid == null) return left(const MessageFailure.noUserConnected());
      final String? pathImage = message.imageSend != null ? 'message/$uid/${message.imageSend!.name}' : null;

      final messageDTO = MessageDTO.fromDomain(message, uid, pathImage);
      await _firestore.messageCollection
          .doc('${uid.getOrCrash()}')
          .collection('discussion')
          .doc('${messageDTO.id}')
          .update(messageDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const MessageFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const MessageFailure.unableToUpdate());
      } else {
        return left(const MessageFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<MessageFailure, List<Message>>> watch() async* {
    //UID de l'utilisateur
    final uid = (await _getUidUser());
    if (uid == null) yield left(const MessageFailure.noUserConnected());

    final collection =
        _firestore.messageCollection.doc('${uid!.getOrCrash()}').collection('discussion').orderBy('date');

    yield* collection
        .snapshots()
        .map(
          (snapshot) => right<MessageFailure, List<Message>>(
            snapshot.docs.map((doc) {
              try {
                final MessageDTO dto = MessageDTO.fromFirestore(doc);

                //Image !
                Future<Uint8List?>? imageRead;
                if (dto.imagePath != null) {
                  try {
                    final ref = _storage.ref().child(dto.imagePath!);
                    const oneMegabyte = 2048 * 2048;
                    imageRead = ref.getData(oneMegabyte);
                  } catch (e) {
                    print('Fatal Error : $e');
                    imageRead = null;
                  }
                }

                return dto.toDomain(imageRead);
              } catch (e) {}
              return Message.empty();
            }).toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const MessageFailure.insufficientPermission());
      } else {
        return left(const MessageFailure.unexpected());
      }
    });
  }

  Future<UniqueId?> _getUidUser() async {
    final user = (await _authRepository.getUserData()).fold(() => null, (user) => user);

    //UID de l'utilisateur
    return user?.id;
  }

  Future<UserData?> _getUser() async {
    return (await _authRepository.getUserData()).fold(() => null, (user) => user);
  }
}
