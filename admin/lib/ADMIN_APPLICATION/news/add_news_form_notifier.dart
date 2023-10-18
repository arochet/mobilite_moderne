import 'package:admin/ADMIN_DOMAIN/core/upload_failure.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/news/admin_news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/DOMAIN/news/value_objects.dart';
part 'add_news_form_notifier.freezed.dart';

@freezed
class AddNewsFormData with _$AddNewsFormData {
  const factory AddNewsFormData({
    required News news,
    required XFile? image,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<NewsFailure, Unit>> authFailureOrSuccessOption,
  }) = _AddNewsFormData;

  factory AddNewsFormData.initial() => AddNewsFormData(
      image: null,
      news: News.empty(),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class NewsFormNotifier extends StateNotifier<AddNewsFormData> {
  final IAdminNewsRepository _iNewsRepository;

  NewsFormNotifier(this._iNewsRepository) : super(AddNewsFormData.initial());

  titleChanged(String param) {
    state =
        state.copyWith(news: state.news.copyWith(title: AppTitle(param)), authFailureOrSuccessOption: none());
  }

  contentChanged(String param) {
    state = state.copyWith(news: state.news.copyWith(content: param), authFailureOrSuccessOption: none());
  }

  imageChanged(XFile param) {
    state = state.copyWith(
        image: param,
        news: state.news.copyWith(image: 'actualites/${param.name}'),
        authFailureOrSuccessOption: none());
  }

  subcontentChanged(String param) {
    state = state.copyWith(news: state.news.copyWith(subcontent: param), authFailureOrSuccessOption: none());
  }

  keywordsChanged(String param) {
    //[REVOIR]
    state = state.copyWith(
        news: state.news.copyWith(keywords: param.split('/')), authFailureOrSuccessOption: none());
  }
//insert-changed

  addNewsPressed() async {
    Either<NewsFailure, Unit>? failureOrSuccess;

    final istitleValid = state.news.title.isValid();
    //insert-valid-params
    if (false /* insert-valid-condition */ || istitleValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      // Upload de l'image
      Either<UploadFailure, Unit>? resultUpload;
      if (state.image != null) {
        resultUpload = await this._iNewsRepository.uploadImage(state.image!);
      }

      //Création de l'actualité
      if (resultUpload?.isRight() == true) {
        failureOrSuccess = await this._iNewsRepository.create(state.news);

        if (failureOrSuccess.isRight() && resultUpload?.isRight() == true) {
          state = state.copyWith(news: News.empty());
        }
      } else {
        failureOrSuccess = left(const NewsFailure.unableToLoadImage());
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
