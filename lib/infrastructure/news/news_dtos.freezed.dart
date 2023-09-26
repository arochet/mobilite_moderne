// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsDTO _$NewsDTOFromJson(Map<String, dynamic> json) {
  return _NewsDTO.fromJson(json);
}

/// @nodoc
mixin _$NewsDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get subcontent => throw _privateConstructorUsedError;
  List<String> get keywords => throw _privateConstructorUsedError;
  int get datePublished => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsDTOCopyWith<NewsDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDTOCopyWith<$Res> {
  factory $NewsDTOCopyWith(NewsDTO value, $Res Function(NewsDTO) then) =
      _$NewsDTOCopyWithImpl<$Res, NewsDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String title,
      String content,
      String image,
      String subcontent,
      List<String> keywords,
      int datePublished});
}

/// @nodoc
class _$NewsDTOCopyWithImpl<$Res, $Val extends NewsDTO>
    implements $NewsDTOCopyWith<$Res> {
  _$NewsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? content = null,
    Object? image = null,
    Object? subcontent = null,
    Object? keywords = null,
    Object? datePublished = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      subcontent: null == subcontent
          ? _value.subcontent
          : subcontent // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      datePublished: null == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsDTOCopyWith<$Res> implements $NewsDTOCopyWith<$Res> {
  factory _$$_NewsDTOCopyWith(
          _$_NewsDTO value, $Res Function(_$_NewsDTO) then) =
      __$$_NewsDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String title,
      String content,
      String image,
      String subcontent,
      List<String> keywords,
      int datePublished});
}

/// @nodoc
class __$$_NewsDTOCopyWithImpl<$Res>
    extends _$NewsDTOCopyWithImpl<$Res, _$_NewsDTO>
    implements _$$_NewsDTOCopyWith<$Res> {
  __$$_NewsDTOCopyWithImpl(_$_NewsDTO _value, $Res Function(_$_NewsDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? content = null,
    Object? image = null,
    Object? subcontent = null,
    Object? keywords = null,
    Object? datePublished = null,
  }) {
    return _then(_$_NewsDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      subcontent: null == subcontent
          ? _value.subcontent
          : subcontent // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      datePublished: null == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsDTO extends _NewsDTO {
  const _$_NewsDTO(
      {@JsonKey(ignore: true) this.id,
      required this.title,
      required this.content,
      required this.image,
      required this.subcontent,
      required final List<String> keywords,
      required this.datePublished})
      : _keywords = keywords,
        super._();

  factory _$_NewsDTO.fromJson(Map<String, dynamic> json) =>
      _$$_NewsDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String image;
  @override
  final String subcontent;
  final List<String> _keywords;
  @override
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  final int datePublished;

  @override
  String toString() {
    return 'NewsDTO(id: $id, title: $title, content: $content, image: $image, subcontent: $subcontent, keywords: $keywords, datePublished: $datePublished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.subcontent, subcontent) ||
                other.subcontent == subcontent) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.datePublished, datePublished) ||
                other.datePublished == datePublished));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      image,
      subcontent,
      const DeepCollectionEquality().hash(_keywords),
      datePublished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsDTOCopyWith<_$_NewsDTO> get copyWith =>
      __$$_NewsDTOCopyWithImpl<_$_NewsDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsDTOToJson(
      this,
    );
  }
}

abstract class _NewsDTO extends NewsDTO {
  const factory _NewsDTO(
      {@JsonKey(ignore: true) final String? id,
      required final String title,
      required final String content,
      required final String image,
      required final String subcontent,
      required final List<String> keywords,
      required final int datePublished}) = _$_NewsDTO;
  const _NewsDTO._() : super._();

  factory _NewsDTO.fromJson(Map<String, dynamic> json) = _$_NewsDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get image;
  @override
  String get subcontent;
  @override
  List<String> get keywords;
  @override
  int get datePublished;
  @override
  @JsonKey(ignore: true)
  _$$_NewsDTOCopyWith<_$_NewsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
