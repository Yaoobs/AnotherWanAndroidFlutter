import 'dart:async';

import 'package:anotherwanandroidflutter/business/tree/models/tree_node_data.dart';
import 'package:anotherwanandroidflutter/network/tree/net_tree.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'treelist_event.dart';
part 'treelist_state.dart';

class TreeListBloc extends Bloc<TreeListEvent, TreeListState> {
  TreeListBloc() : super(TreeListState());

  @override
  Stream<TreeListState> mapEventToState(
    TreeListEvent event,
  ) async* {
    if (event is TreeListEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  Stream<TreeListState> _mapLoadDataToState(
    TreeListEvent event,
    TreeListState state,
  ) async* {
    // 获取 体系列表
    List treeList = await AWATreeNetManager.treeList();
    List<TreeNodeData> nodeDatas = List<Map>.from(treeList)
        .map((dynamic e) => TreeNodeData.fromJson(e))
        .toList();
    yield state.copyWith(
      nodeDatas: nodeDatas,
    );
  }
}
