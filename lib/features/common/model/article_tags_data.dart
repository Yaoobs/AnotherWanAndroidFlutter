import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_tags_data.freezed.dart';
part 'article_tags_data.g.dart';

@freezed
abstract class ArticleTagsData with _$ArticleTagsData {
  const factory ArticleTagsData({
    String? name,
    String? url,
  }) = _ArticleListData;

  factory ArticleTagsData.fromJson(Map<String, dynamic> json) =>
      _$ArticleTagsDataFromJson(json);
}
