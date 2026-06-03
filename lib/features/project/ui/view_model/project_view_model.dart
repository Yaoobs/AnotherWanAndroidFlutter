import 'package:anotherwanandroidflutter/features/project/repository/project_repository.dart';
import 'package:anotherwanandroidflutter/features/project/ui/state/project_state.dart';
import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_view_model.g.dart';

@Riverpod(keepAlive: false)
class ProjectViewModel extends _$ProjectViewModel {
  late ProjectRepository _repository;
  @override
  FutureOr<ProjectState> build() async {
    _repository = await ref.watch(projectRepositoryProvider.future);
    List<TreeNodeData> projectTree = await _repository.getProjectTree();
    return ProjectState(projectTree: projectTree);
  }

  Future<void> getProjectTree() async {
    try {
      List<TreeNodeData> projectTree = await _repository.getProjectTree();
      state = AsyncData(state.value!.copyWith(projectTree: projectTree));
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
