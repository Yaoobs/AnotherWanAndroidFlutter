import 'package:anotherwanandroidflutter/api/tree/tree_api.dart';
import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tree_list_repository.g.dart';

@riverpod
Future<TreeListRepository> treeListRepository(Ref ref) async {
  return TreeListRepository();
}

class TreeListRepository {
  TreeListRepository();
  final List<TreeNodeData> _treeList = [];

  Future<List<TreeNodeData>> getTreeList() async {
    try {
      _treeList.clear();
      // 获取 体系列表
      List<TreeNodeData> treeList = await TreeApi.treeList();
      _treeList.insertAll(0, treeList);
    } catch (e) {
      throw Exception('Failed to fetch hotKeys: $e');
    }
    return _treeList;
  }
}
