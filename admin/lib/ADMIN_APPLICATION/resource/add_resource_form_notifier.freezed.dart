// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_resource_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddResourceFormData {
  Resource get resource => throw _privateConstructorUsedError;
  ResourceCategory get category => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;
  String? get nameFile => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ResourceFailure, UniqueId>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddResourceFormDataCopyWith<AddResourceFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddResourceFormDataCopyWith<$Res> {
  factory $AddResourceFormDataCopyWith(
          AddResourceFormData value, $Res Function(AddResourceFormData) then) =
      _$AddResourceFormDataCopyWithImpl<$Res, AddResourceFormData>;
  @useResult
  $Res call(
      {Resource resource,
      ResourceCategory category,
      File? file,
      String? nameFile,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ResourceFailure, UniqueId>> failureOrSuccessOption});

  $ResourceCopyWith<$Res> get resource;
}

/// @nodoc
class _$AddResourceFormDataCopyWithImpl<$Res, $Val extends AddResourceFormData>
    implements $AddResourceFormDataCopyWith<$Res> {
  _$AddResourceFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = null,
    Object? category = null,
    Object? file = freezed,
    Object? nameFile = freezed,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      resource: null == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ResourceCategory,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      nameFile: freezed == nameFile
          ? _value.nameFile
          : nameFile // ignore: cast_nullable_to_non_nullable
              as String?,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ResourceFailure, UniqueId>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res> get resource {
    return $ResourceCopyWith<$Res>(_value.resource, (value) {
      return _then(_value.copyWith(resource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddResourceFormDataCopyWith<$Res>
    implements $AddResourceFormDataCopyWith<$Res> {
  factory _$$_AddResourceFormDataCopyWith(_$_AddResourceFormData value,
          $Res Function(_$_AddResourceFormData) then) =
      __$$_AddResourceFormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Resource resource,
      ResourceCategory category,
      File? file,
      String? nameFile,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ResourceFailure, UniqueId>> failureOrSuccessOption});

  @override
  $ResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$$_AddResourceFormDataCopyWithImpl<$Res>
    extends _$AddResourceFormDataCopyWithImpl<$Res, _$_AddResourceFormData>
    implements _$$_AddResourceFormDataCopyWith<$Res> {
  __$$_AddResourceFormDataCopyWithImpl(_$_AddResourceFormData _value,
      $Res Function(_$_AddResourceFormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = null,
    Object? category = null,
    Object? file = freezed,
    Object? nameFile = freezed,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_AddResourceFormData(
      resource: null == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ResourceCategory,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      nameFile: freezed == nameFile
          ? _value.nameFile
          : nameFile // ignore: cast_nullable_to_non_nullable
              as String?,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ResourceFailure, UniqueId>>,
    ));
  }
}

/// @nodoc

class _$_AddResourceFormData implements _AddResourceFormData {
  const _$_AddResourceFormData(
      {required this.resource,
      required this.category,
      required this.file,
      required this.nameFile,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.failureOrSuccessOption});

  @override
  final Resource resource;
  @override
  final ResourceCategory category;
  @override
  final File? file;
  @override
  final String? nameFile;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ResourceFailure, UniqueId>> failureOrSuccessOption;

  @override
  String toString() {
    return 'AddResourceFormData(resource: $resource, category: $category, file: $file, nameFile: $nameFile, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddResourceFormData &&
            (identical(other.resource, resource) ||
                other.resource == resource) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.nameFile, nameFile) ||
                other.nameFile == nameFile) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource, category, file,
      nameFile, showErrorMessages, isSubmitting, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddResourceFormDataCopyWith<_$_AddResourceFormData> get copyWith =>
      __$$_AddResourceFormDataCopyWithImpl<_$_AddResourceFormData>(
          this, _$identity);
}

abstract class _AddResourceFormData implements AddResourceFormData {
  const factory _AddResourceFormData(
      {required final Resource resource,
      required final ResourceCategory category,
      required final File? file,
      required final String? nameFile,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ResourceFailure, UniqueId>>
          failureOrSuccessOption}) = _$_AddResourceFormData;

  @override
  Resource get resource;
  @override
  ResourceCategory get category;
  @override
  File? get file;
  @override
  String? get nameFile;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ResourceFailure, UniqueId>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddResourceFormDataCopyWith<_$_AddResourceFormData> get copyWith =>
      throw _privateConstructorUsedError;
}
