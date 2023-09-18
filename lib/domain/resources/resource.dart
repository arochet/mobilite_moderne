import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

part 'resources.freezed.dart';

/// Une ressource est un document, une vidéo, un lien, etc. qui est lié à une catégorie
/// On peut le retrouver via recherche par mot clé ou dans la description
@freezed
abstract class Resource with _$Resource {
  const Resource._();

  const factory Resource({
    required UniqueId id,
    required String documentPath,
    required UniqueId idCategory,
    required String keyword,
    required String description,
  }) = _Resources;

  factory Resource.empty() => Resource(
        id: UniqueId(),
        documentPath: '',
        idCategory: UniqueId(),
        keyword: '',
        description: '',
      );
}
