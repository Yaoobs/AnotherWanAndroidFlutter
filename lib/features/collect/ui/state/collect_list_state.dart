import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collect_list_state.freezed.dart';
part 'collect_list_state.g.dart';

@freezed
abstract class CollectListState with _$CollectListState {
  const factory CollectListState({
    @Default([]) List<ArticleData> articles,
    @Default(false) bool noMore,
    @Default(0) int page,
    String? errorMessage,
  }) = _CollectListState;

  factory CollectListState.fromJson(Map<String, Object?> json) =>
      _$CollectListStateFromJson(json);
}
