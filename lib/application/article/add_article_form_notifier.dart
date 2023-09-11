import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/article/article.dart';
import 'package:mobilite_moderne/DOMAIN/article/article_failure.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/article/article_repository.dart';
part 'add_article_form_notifier.freezed.dart';

@freezed
class AddArticleFormData with _$AddArticleFormData {
  const factory AddArticleFormData({
    required Article article,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ArticleFailure, Unit>> authFailureOrSuccessOption,
  }) = _AddArticleFormData;

  factory AddArticleFormData.initial() => AddArticleFormData(
      article: Article.empty(),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class ArticleFormNotifier extends StateNotifier<AddArticleFormData> {
  final IArticleRepository _iArticleRepository;

  ArticleFormNotifier(this._iArticleRepository) : super(AddArticleFormData.initial());

  titleChanged(String param) {
    state = state.copyWith(
        article: state.article.copyWith(title: Nom(param)), authFailureOrSuccessOption: none());
  }

  brandChanged(String param) {
    state = state.copyWith(
        article: state.article.copyWith(brand: Nom(param)), authFailureOrSuccessOption: none());
  }

  descriptionChanged(String param) {
    state = state.copyWith(
        article: state.article.copyWith(description: param), authFailureOrSuccessOption: none());
  }

  keywordChanged(String param) {
    state =
        state.copyWith(article: state.article.copyWith(keyword: param), authFailureOrSuccessOption: none());
  }

  listRessourcesChanged(String param) {
    state = state.copyWith(
        article: state.article.copyWith(listRessources: param), authFailureOrSuccessOption: none());
  }

  categoryChanged(String param) {
    state =
        state.copyWith(article: state.article.copyWith(category: param), authFailureOrSuccessOption: none());
  }
//insert-changed

  addArticlePressed() async {
    Either<ArticleFailure, Unit>? failureOrSuccess;

    final istitleValid = state.article.title.isValid();
    final isbrandValid = state.article.brand.isValid();
//insert-valid-params
    if (false /* insert-valid-condition */ || isbrandValid || istitleValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._iArticleRepository.create(state.article);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(article: Article.empty());
      }
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
