// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choice_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChoiceDTO _$ChoiceDTOFromJson(Map<String, dynamic> json) {
  return _ChoiceDTO.fromJson(json);
}

/// @nodoc
mixin _$ChoiceDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;
  List<String>? get listRessources => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceDTOCopyWith<ChoiceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceDTOCopyWith<$Res> {
  factory $ChoiceDTOCopyWith(ChoiceDTO value, $Res Function(ChoiceDTO) then) =
      _$ChoiceDTOCopyWithImpl<$Res, ChoiceDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String nom,
      String? question,
      String? answer,
      List<String>? listRessources});
}

/// @nodoc
class _$ChoiceDTOCopyWithImpl<$Res, $Val extends ChoiceDTO>
    implements $ChoiceDTOCopyWith<$Res> {
  _$ChoiceDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? question = freezed,
    Object? answer = freezed,
    Object? listRessources = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      listRessources: freezed == listRessources
          ? _value.listRessources
          : listRessources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChoiceDTOImplCopyWith<$Res>
    implements $ChoiceDTOCopyWith<$Res> {
  factory _$$ChoiceDTOImplCopyWith(
          _$ChoiceDTOImpl value, $Res Function(_$ChoiceDTOImpl) then) =
      __$$ChoiceDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String nom,
      String? question,
      String? answer,
      List<String>? listRessources});
}

/// @nodoc
class __$$ChoiceDTOImplCopyWithImpl<$Res>
    extends _$ChoiceDTOCopyWithImpl<$Res, _$ChoiceDTOImpl>
    implements _$$ChoiceDTOImplCopyWith<$Res> {
  __$$ChoiceDTOImplCopyWithImpl(
      _$ChoiceDTOImpl _value, $Res Function(_$ChoiceDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? question = freezed,
    Object? answer = freezed,
    Object? listRessources = freezed,
  }) {
    return _then(_$ChoiceDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      listRessources: freezed == listRessources
          ? _value._listRessources
          : listRessources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChoiceDTOImpl extends _ChoiceDTO {
  const _$ChoiceDTOImpl(
      {@JsonKey(ignore: true) this.id,
      required this.nom,
      required this.question,
      required this.answer,
      required final List<String>? listRessources})
      : _listRessources = listRessources,
        super._();

  factory _$ChoiceDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChoiceDTOImplFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String nom;
  @override
  final String? question;
  @override
  final String? answer;
  final List<String>? _listRessources;
  @override
  List<String>? get listRessources {
    final value = _listRessources;
    if (value == null) return null;
    if (_listRessources is EqualUnmodifiableListView) return _listRessources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChoiceDTO(id: $id, nom: $nom, question: $question, answer: $answer, listRessources: $listRessources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoiceDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other._listRessources, _listRessources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, question, answer,
      const DeepCollectionEquality().hash(_listRessources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoiceDTOImplCopyWith<_$ChoiceDTOImpl> get copyWith =>
      __$$ChoiceDTOImplCopyWithImpl<_$ChoiceDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoiceDTOImplToJson(
      this,
    );
  }
}

abstract class _ChoiceDTO extends ChoiceDTO {
  const factory _ChoiceDTO(
      {@JsonKey(ignore: true) final String? id,
      required final String nom,
      required final String? question,
      required final String? answer,
      required final List<String>? listRessources}) = _$ChoiceDTOImpl;
  const _ChoiceDTO._() : super._();

  factory _ChoiceDTO.fromJson(Map<String, dynamic> json) =
      _$ChoiceDTOImpl.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get nom;
  @override
  String? get question;
  @override
  String? get answer;
  @override
  List<String>? get listRessources;
  @override
  @JsonKey(ignore: true)
  _$$ChoiceDTOImplCopyWith<_$ChoiceDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
