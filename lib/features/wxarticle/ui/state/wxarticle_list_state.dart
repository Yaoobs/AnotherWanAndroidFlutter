import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wxarticle_list_state.freezed.dart';
part 'wxarticle_list_state.g.dart';

@freezed
abstract class WxArticleListState with _$WxArticleListState {
  const factory WxArticleListState({
    @Default([]) List<ArticleData> articles,
    @Default(false) bool noMore,
    @Default(1) int page,
    @Default(0) int id,
    String? errorMessage,
  }) = _WxArticleListState;

  factory WxArticleListState.fromJson(Map<String, Object?> json) =>
      _$WxArticleListStateFromJson(json);
}
