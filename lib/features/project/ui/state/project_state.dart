import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_state.freezed.dart';
part 'project_state.g.dart';

@freezed
abstract class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default([]) List<TreeNodeData> projectTree,
    String? errorMessage,
  }) = _ProjectState;

  factory ProjectState.fromJson(Map<String, Object?> json) =>
      _$ProjectStateFromJson(json);
}
