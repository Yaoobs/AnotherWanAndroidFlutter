import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_list_state.freezed.dart';
part 'tree_list_state.g.dart';

@freezed
abstract class TreeListState with _$TreeListState {
  const factory TreeListState({
    @Default([]) List<TreeNodeData> treeList,
    String? errorMessage,
  }) = _TreeListState;

  factory TreeListState.fromJson(Map<String, Object?> json) =>
      _$TreeListStateFromJson(json);
}
