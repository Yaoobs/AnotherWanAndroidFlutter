import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wxarticle_state.freezed.dart';
part 'wxarticle_state.g.dart';

@freezed
abstract class WxArticleState with _$WxArticleState {
  const factory WxArticleState({
    @Default([]) List<TreeNodeData> articleChapters,
    String? errorMessage,
  }) = _WxArticleState;

  factory WxArticleState.fromJson(Map<String, Object?> json) =>
      _$WxArticleStateFromJson(json);
}
