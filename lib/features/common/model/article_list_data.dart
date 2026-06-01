import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_list_data.freezed.dart';
part 'article_list_data.g.dart';

@freezed
abstract class ArticleListData with _$ArticleListData {
  const factory ArticleListData({
    List<ArticleData>? datas,
    int? pageCount,
    int? curPage,
  }) = _ArticleListData;

  factory ArticleListData.fromJson(Map<String, dynamic> json) =>
      _$ArticleListDataFromJson(json);
}
