import 'package:anotherwanandroidflutter/api/tree/tree_api.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
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
      List<TreeNodeData> results = await TreeApi.treeList();
      _treeList.insertAll(0, results);
    } catch (e) {
      throw Exception('Failed to fetch hotKeys: $e');
    }
    return _treeList;
  }

  Future<ArticleListData> getItemData({int page = 0, int cid = 0}) async {
    final List<ArticleData> articles = [];
    if (page == 0) {
      articles.clear();
    }
    Map articleList = {};
    try {
      articleList = await TreeApi.treeItems(page: page, cid: cid);
      List<ArticleData> results = List<Map>.from(
        articleList['datas'],
      ).map((dynamic e) => ArticleData.fromJson(e)).toList();
      articles.addAll(results);
    } catch (e) {
      throw Exception('Failed to fetch searchResults: $e');
    }
    return ArticleListData(
      datas: articles,
      pageCount: articleList['pageCount'],
      curPage: articleList['curPage'],
    );
  }
}
