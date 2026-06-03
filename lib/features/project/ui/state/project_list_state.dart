import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_list_state.freezed.dart';
part 'project_list_state.g.dart';

@freezed
abstract class ProjectListState with _$ProjectListState {
  const factory ProjectListState({
    @Default([]) List<ArticleData> articles,
    @Default(false) bool noMore,
    @Default(1) int page,
    @Default(0) int cid,
    String? errorMessage,
  }) = _ProjectListState;

  factory ProjectListState.fromJson(Map<String, Object?> json) =>
      _$ProjectListStateFromJson(json);
}
