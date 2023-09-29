import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';

import 'package:admin/ADMIN_INFRASTRUCTURE/user/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:mobilite_moderne/DOMAIN/message/conversation.dart';
import 'package:mobilite_moderne/DOMAIN/message/message_failure.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/message/message_dtos.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/message/conversation_dtos.dart';

abstract class IMessageRepository {
  Stream<Either<MessageFailure, List<Message>>> watchConversation(UniqueId idUser);
  Stream<Either<MessageFailure, List<Conversation>>> watchAllConversation();
  Future<Either<MessageFailure, Unit>> create(UniqueId idUser, Message message);
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
  Future<Either<MessageFailure, Unit>> create(UniqueId idUser, Message message) async {
    try {
      //UID de l'utilisateur
      final uidAdmin = (await _getUidUser());
      if (uidAdmin == null) return left(const MessageFailure.noUserConnected());
      final String? pathImage =
          message.imageSend != null ? 'message/${idUser.getOrCrash()}/${message.imageSend!.name}' : null;

      //S'il y'a une image, on l'ajoute
      if (message.imageSend != null) {
        final TaskSnapshot result =
            await _storage.ref().child(pathImage!).putFile(File(message.imageSend!.path));
      }

      //On crée le méchant message
      final messageDTO = MessageDTO.fromDomain(message, uidAdmin, pathImage);
      await _firestore.messageCollection
          .doc(idUser.getOrCrash())
          .collection('discussion')
          .doc('${messageDTO.id}')
          .set(messageDTO.toJson());

      //Actualisation de la conversation
      await _firestore.messageCollection
          .doc(idUser.getOrCrash())
          .update({'dateLastMessage': message.date.millisecondsSinceEpoch, 'isRead': true});

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
      await _firestore.messageCollection.doc(id.getOrCrash()).delete();

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
      final uidAdmin = (await _getUidUser());
      if (uidAdmin == null) return left(const MessageFailure.noUserConnected());

      final messageDTO = MessageDTO.fromDomain(message, uidAdmin, null);
      await _firestore.messageCollection.doc(messageDTO.id).update(messageDTO.toJson());

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
  Stream<Either<MessageFailure, List<Message>>> watchConversation(UniqueId idUser) async* {
    final collection =
        _firestore.messageCollection.doc(idUser.getOrCrash()).collection('discussion').orderBy('date');

    final stream = collection
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

    yield* stream;
  }

  @override
  Stream<Either<MessageFailure, List<Conversation>>> watchAllConversation() async* {
    final collection = _firestore.messageCollection.orderBy('dateLastMessage', descending: true);

    final stream = collection
        .snapshots()
        .map(
          (snapshot) => right<MessageFailure, List<Conversation>>(
            snapshot.docs.map((doc) {
              try {
                return ConversationDTO.fromFirestore(doc).toDomain();
              } catch (e, trace) {
                print('Erreur ! $e');
                print(trace);
              }
              return Conversation.empty();
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

    yield* stream;
  }

  Future<UniqueId?> _getUidUser() async {
    final user = (await _authRepository.getUserData()).fold(() => null, (user) => user);

    //UID de l'utilisateur
    return user?.id;
  }
}
