import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/news/news_repository.dart';
part 'add_news_form_notifier.freezed.dart';

@freezed
class AddNewsFormData with _$AddNewsFormData {
  const factory AddNewsFormData({
    required News news,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<NewsFailure, Unit>> authFailureOrSuccessOption,
  }) = _AddNewsFormData;

  factory AddNewsFormData.initial() => AddNewsFormData(
      news: News.empty(), showErrorMessages: false, isSubmitting: false, authFailureOrSuccessOption: none());
}

class NewsFormNotifier extends StateNotifier<AddNewsFormData> {
  final INewsRepository _iNewsRepository;

  NewsFormNotifier(this._iNewsRepository) : super(AddNewsFormData.initial());

  titleChanged(String param) {
    state = state.copyWith(news: state.news.copyWith(title: Nom(param)), authFailureOrSuccessOption: none());
  }

  contentChanged(String param) {
    state = state.copyWith(news: state.news.copyWith(content: param), authFailureOrSuccessOption: none());
  }

  imageChanged(String param) {
    state = state.copyWith(news: state.news.copyWith(image: param), authFailureOrSuccessOption: none());
  }

  subcontentChanged(String param) {
    state = state.copyWith(news: state.news.copyWith(subcontent: param), authFailureOrSuccessOption: none());
  }

  keywordsChanged(String param) {
    //[REVOIR]
    state = state.copyWith(news: state.news.copyWith(keywords: [param]), authFailureOrSuccessOption: none());
  }
//insert-changed

  addNewsPressed() async {
    Either<NewsFailure, Unit>? failureOrSuccess;

    final istitleValid = state.news.title.isValid();
//insert-valid-params
    if (false /* insert-valid-condition */ || istitleValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._iNewsRepository.create(state.news);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(news: News.empty());
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
