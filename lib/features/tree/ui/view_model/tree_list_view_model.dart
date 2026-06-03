import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:anotherwanandroidflutter/features/tree/repository/tree_list_repository.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/state/tree_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tree_list_view_model.g.dart';

@Riverpod(keepAlive: false)
class TreeListViewModel extends _$TreeListViewModel {
  late TreeListRepository _repository;
  @override
  FutureOr<TreeListState> build() async {
    _repository = await ref.watch(treeListRepositoryProvider.future);
    List<TreeNodeData> treeList = await _repository.getTreeList();
    return TreeListState(treeList: treeList);
  }

  Future<void> getTreeList() async {
    try {
      List<TreeNodeData> treeList = await _repository.getTreeList();
      state = AsyncData(state.value!.copyWith(treeList: treeList));
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
