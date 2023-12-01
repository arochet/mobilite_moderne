// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChoiceWithQuestions {
  UniqueId get id => throw _privateConstructorUsedError;

  /// Titre de la question
  Nom get nom => throw _privateConstructorUsedError;

  /// Question posée à l'utilisateur
  Question get question => throw _privateConstructorUsedError;

  /// Fil d'ariane pour retrouver le choix dans Firebase
  String get path => throw _privateConstructorUsedError;

  /// Liste des choix possibles pour cette question
  List<ChoiceWithQuestions>? get choiceQuestion =>
      throw _privateConstructorUsedError;

  /// Ou bien liste des réponses
  List<ChoiceWithAnswer>? get choiceAnswer =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChoiceWithQuestionsCopyWith<ChoiceWithQuestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceWithQuestionsCopyWith<$Res> {
  factory $ChoiceWithQuestionsCopyWith(
          ChoiceWithQuestions value, $Res Function(ChoiceWithQuestions) then) =
      _$ChoiceWithQuestionsCopyWithImpl<$Res, ChoiceWithQuestions>;
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      Question question,
      String path,
      List<ChoiceWithQuestions>? choiceQuestion,
      List<ChoiceWithAnswer>? choiceAnswer});
}

/// @nodoc
class _$ChoiceWithQuestionsCopyWithImpl<$Res, $Val extends ChoiceWithQuestions>
    implements $ChoiceWithQuestionsCopyWith<$Res> {
  _$ChoiceWithQuestionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? question = null,
    Object? path = null,
    Object? choiceQuestion = freezed,
    Object? choiceAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as Nom,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      choiceQuestion: freezed == choiceQuestion
          ? _value.choiceQuestion
          : choiceQuestion // ignore: cast_nullable_to_non_nullable
              as List<ChoiceWithQuestions>?,
      choiceAnswer: freezed == choiceAnswer
          ? _value.choiceAnswer
          : choiceAnswer // ignore: cast_nullable_to_non_nullable
              as List<ChoiceWithAnswer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChoiceWithQuestionsImplCopyWith<$Res>
    implements $ChoiceWithQuestionsCopyWith<$Res> {
  factory _$$ChoiceWithQuestionsImplCopyWith(_$ChoiceWithQuestionsImpl value,
          $Res Function(_$ChoiceWithQuestionsImpl) then) =
      __$$ChoiceWithQuestionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      Question question,
      String path,
      List<ChoiceWithQuestions>? choiceQuestion,
      List<ChoiceWithAnswer>? choiceAnswer});
}

/// @nodoc
class __$$ChoiceWithQuestionsImplCopyWithImpl<$Res>
    extends _$ChoiceWithQuestionsCopyWithImpl<$Res, _$ChoiceWithQuestionsImpl>
    implements _$$ChoiceWithQuestionsImplCopyWith<$Res> {
  __$$ChoiceWithQuestionsImplCopyWithImpl(_$ChoiceWithQuestionsImpl _value,
      $Res Function(_$ChoiceWithQuestionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? question = null,
    Object? path = null,
    Object? choiceQuestion = freezed,
    Object? choiceAnswer = freezed,
  }) {
    return _then(_$ChoiceWithQuestionsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as Nom,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      choiceQuestion: freezed == choiceQuestion
          ? _value._choiceQuestion
          : choiceQuestion // ignore: cast_nullable_to_non_nullable
              as List<ChoiceWithQuestions>?,
      choiceAnswer: freezed == choiceAnswer
          ? _value._choiceAnswer
          : choiceAnswer // ignore: cast_nullable_to_non_nullable
              as List<ChoiceWithAnswer>?,
    ));
  }
}

/// @nodoc

class _$ChoiceWithQuestionsImpl extends _ChoiceWithQuestions {
  const _$ChoiceWithQuestionsImpl(
      {required this.id,
      required this.nom,
      required this.question,
      required this.path,
      required final List<ChoiceWithQuestions>? choiceQuestion,
      required final List<ChoiceWithAnswer>? choiceAnswer})
      : _choiceQuestion = choiceQuestion,
        _choiceAnswer = choiceAnswer,
        super._();

  @override
  final UniqueId id;

  /// Titre de la question
  @override
  final Nom nom;

  /// Question posée à l'utilisateur
  @override
  final Question question;

  /// Fil d'ariane pour retrouver le choix dans Firebase
  @override
  final String path;

  /// Liste des choix possibles pour cette question
  final List<ChoiceWithQuestions>? _choiceQuestion;

  /// Liste des choix possibles pour cette question
  @override
  List<ChoiceWithQuestions>? get choiceQuestion {
    final value = _choiceQuestion;
    if (value == null) return null;
    if (_choiceQuestion is EqualUnmodifiableListView) return _choiceQuestion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Ou bien liste des réponses
  final List<ChoiceWithAnswer>? _choiceAnswer;

  /// Ou bien liste des réponses
  @override
  List<ChoiceWithAnswer>? get choiceAnswer {
    final value = _choiceAnswer;
    if (value == null) return null;
    if (_choiceAnswer is EqualUnmodifiableListView) return _choiceAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChoiceWithQuestions(id: $id, nom: $nom, question: $question, path: $path, choiceQuestion: $choiceQuestion, choiceAnswer: $choiceAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoiceWithQuestionsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality()
                .equals(other._choiceQuestion, _choiceQuestion) &&
            const DeepCollectionEquality()
                .equals(other._choiceAnswer, _choiceAnswer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nom,
      question,
      path,
      const DeepCollectionEquality().hash(_choiceQuestion),
      const DeepCollectionEquality().hash(_choiceAnswer));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoiceWithQuestionsImplCopyWith<_$ChoiceWithQuestionsImpl> get copyWith =>
      __$$ChoiceWithQuestionsImplCopyWithImpl<_$ChoiceWithQuestionsImpl>(
          this, _$identity);
}

abstract class _ChoiceWithQuestions extends ChoiceWithQuestions {
  const factory _ChoiceWithQuestions(
          {required final UniqueId id,
          required final Nom nom,
          required final Question question,
          required final String path,
          required final List<ChoiceWithQuestions>? choiceQuestion,
          required final List<ChoiceWithAnswer>? choiceAnswer}) =
      _$ChoiceWithQuestionsImpl;
  const _ChoiceWithQuestions._() : super._();

  @override
  UniqueId get id;
  @override

  /// Titre de la question
  Nom get nom;
  @override

  /// Question posée à l'utilisateur
  Question get question;
  @override

  /// Fil d'ariane pour retrouver le choix dans Firebase
  String get path;
  @override

  /// Liste des choix possibles pour cette question
  List<ChoiceWithQuestions>? get choiceQuestion;
  @override

  /// Ou bien liste des réponses
  List<ChoiceWithAnswer>? get choiceAnswer;
  @override
  @JsonKey(ignore: true)
  _$$ChoiceWithQuestionsImplCopyWith<_$ChoiceWithQuestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChoiceWithAnswer {
  UniqueId get id => throw _privateConstructorUsedError;
  Nom get nom => throw _privateConstructorUsedError;

  /// Chemin du choix dans Firebase
  String get path => throw _privateConstructorUsedError;

  /// Réponse à toutes les questions
  Anwser get answer => throw _privateConstructorUsedError;

  /// Liste des ressources qui sont liées à ce choix (PDF ...)
  List<Resource> get listRessources => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChoiceWithAnswerCopyWith<ChoiceWithAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceWithAnswerCopyWith<$Res> {
  factory $ChoiceWithAnswerCopyWith(
          ChoiceWithAnswer value, $Res Function(ChoiceWithAnswer) then) =
      _$ChoiceWithAnswerCopyWithImpl<$Res, ChoiceWithAnswer>;
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      String path,
      Anwser answer,
      List<Resource> listRessources});
}

/// @nodoc
class _$ChoiceWithAnswerCopyWithImpl<$Res, $Val extends ChoiceWithAnswer>
    implements $ChoiceWithAnswerCopyWith<$Res> {
  _$ChoiceWithAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? path = null,
    Object? answer = null,
    Object? listRessources = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as Nom,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Anwser,
      listRessources: null == listRessources
          ? _value.listRessources
          : listRessources // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChoiceWithAnswerImplCopyWith<$Res>
    implements $ChoiceWithAnswerCopyWith<$Res> {
  factory _$$ChoiceWithAnswerImplCopyWith(_$ChoiceWithAnswerImpl value,
          $Res Function(_$ChoiceWithAnswerImpl) then) =
      __$$ChoiceWithAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      String path,
      Anwser answer,
      List<Resource> listRessources});
}

/// @nodoc
class __$$ChoiceWithAnswerImplCopyWithImpl<$Res>
    extends _$ChoiceWithAnswerCopyWithImpl<$Res, _$ChoiceWithAnswerImpl>
    implements _$$ChoiceWithAnswerImplCopyWith<$Res> {
  __$$ChoiceWithAnswerImplCopyWithImpl(_$ChoiceWithAnswerImpl _value,
      $Res Function(_$ChoiceWithAnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? path = null,
    Object? answer = null,
    Object? listRessources = null,
  }) {
    return _then(_$ChoiceWithAnswerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as Nom,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Anwser,
      listRessources: null == listRessources
          ? _value._listRessources
          : listRessources // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ));
  }
}

/// @nodoc

class _$ChoiceWithAnswerImpl extends _ChoiceWithAnswer {
  const _$ChoiceWithAnswerImpl(
      {required this.id,
      required this.nom,
      required this.path,
      required this.answer,
      required final List<Resource> listRessources})
      : _listRessources = listRessources,
        super._();

  @override
  final UniqueId id;
  @override
  final Nom nom;

  /// Chemin du choix dans Firebase
  @override
  final String path;

  /// Réponse à toutes les questions
  @override
  final Anwser answer;

  /// Liste des ressources qui sont liées à ce choix (PDF ...)
  final List<Resource> _listRessources;

  /// Liste des ressources qui sont liées à ce choix (PDF ...)
  @override
  List<Resource> get listRessources {
    if (_listRessources is EqualUnmodifiableListView) return _listRessources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRessources);
  }

  @override
  String toString() {
    return 'ChoiceWithAnswer(id: $id, nom: $nom, path: $path, answer: $answer, listRessources: $listRessources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoiceWithAnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other._listRessources, _listRessources));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nom, path, answer,
      const DeepCollectionEquality().hash(_listRessources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoiceWithAnswerImplCopyWith<_$ChoiceWithAnswerImpl> get copyWith =>
      __$$ChoiceWithAnswerImplCopyWithImpl<_$ChoiceWithAnswerImpl>(
          this, _$identity);
}

abstract class _ChoiceWithAnswer extends ChoiceWithAnswer {
  const factory _ChoiceWithAnswer(
      {required final UniqueId id,
      required final Nom nom,
      required final String path,
      required final Anwser answer,
      required final List<Resource> listRessources}) = _$ChoiceWithAnswerImpl;
  const _ChoiceWithAnswer._() : super._();

  @override
  UniqueId get id;
  @override
  Nom get nom;
  @override

  /// Chemin du choix dans Firebase
  String get path;
  @override

  /// Réponse à toutes les questions
  Anwser get answer;
  @override

  /// Liste des ressources qui sont liées à ce choix (PDF ...)
  List<Resource> get listRessources;
  @override
  @JsonKey(ignore: true)
  _$$ChoiceWithAnswerImplCopyWith<_$ChoiceWithAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
