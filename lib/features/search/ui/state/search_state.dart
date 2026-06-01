import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/search/model/hotkey_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';
part 'search_state.g.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<HotKeyData> hotKeys,
    @Default([]) List<ArticleData> searchResults,
    @Default(false) bool noMore,
    @Default(0) int page,
    String? errorMessage,
  }) = _SearchState;

  factory SearchState.fromJson(Map<String, Object?> json) =>
      _$SearchStateFromJson(json);
}
