import 'package:anotherwanandroidflutter/api/tree/tree_api.dart';
import 'package:anotherwanandroidflutter/models/tree_node_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'treelist_event.dart';
part 'treelist_state.dart';

class TreeListBloc extends Bloc<TreeListEvent, TreeListState> {
  TreeListBloc() : super(TreeListState()) {
    on<TreeListEventLoadData>(
        (event, emit) => _mapLoadDataToState(event, emit));
  }

  _mapLoadDataToState(
    TreeListEvent event,
    Emitter<TreeListState> emit,
  ) async {
    // 获取 体系列表
    List<TreeNodeData> nodeDatas = await TreeApi.treeList();
    emit(state.copyWith(
      nodeDatas: nodeDatas,
    ));
  }
}
