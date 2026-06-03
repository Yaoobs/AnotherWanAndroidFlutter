import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_items_state.freezed.dart';
part 'tree_items_state.g.dart';

@freezed
abstract class TreeItemsState with _$TreeItemsState {
  const factory TreeItemsState({
    @Default([]) List<ArticleData> articles,
    @Default(false) bool noMore,
    @Default(0) int page,
    @Default(0) int cid,
    String? errorMessage,
  }) = _TreeItemsState;

  factory TreeItemsState.fromJson(Map<String, Object?> json) =>
      _$TreeItemsStateFromJson(json);
}
