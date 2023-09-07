import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';

part 'user_auth.freezed.dart';

/// Identifiant unique de l'utilisateur dans FireAuth
@freezed
abstract class UserAuth with _$UserAuth {
  const factory UserAuth({required UniqueId id}) = _UserAuth;
}
