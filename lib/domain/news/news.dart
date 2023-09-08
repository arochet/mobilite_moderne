import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

part 'news.freezed.dart';

/// Article des actualités<br>
/// On y trouve un titre, une image et un contenu
/// La liste des articles sont stocké dans Algolia
@freezed
abstract class News with _$News {
  const News._();

  const factory News({
    required UniqueId id,
    required Nom title,
    required String content,
    required String image,
    required String subcontent,
    required List<String> keywords,
  }) = _News;

  factory News.empty() => News(
        id: UniqueId(),
        title: Nom(''),
        content: '',
        image: '',
        subcontent: '',
        keywords: [],
      );
}
