import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'article_state.freezed.dart';
part 'article_state.g.dart';

@freezed
abstract class ArticleState with _$ArticleState {
  const factory ArticleState({
    @Default([]) List<ArticleData> articles,
    @Default(false) bool noMore,
    @Default(0) int page,
    String? errorMessage,
  }) = _ArticleState;

  factory ArticleState.fromJson(Map<String, Object?> json) =>
      _$ArticleStateFromJson(json);
}