import 'package:anotherwanandroidflutter/api/project/project_api.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_repository.g.dart';

@riverpod
Future<ProjectRepository> projectRepository(Ref ref) async {
  return ProjectRepository();
}

class ProjectRepository {
  ProjectRepository();

  Future<List<TreeNodeData>> getProjectTree() async {
    final List<TreeNodeData> projectTree = [];
    try {
      // 获取 体系列表
      List<TreeNodeData> results =  await ProjectApi.projectTree();
      projectTree.addAll(results);
    } catch (e) {
      throw Exception('Failed to fetch projectTree: $e');
    }
    return projectTree;
  }

  Future<ArticleListData> getProjectList({
    int page = 1,
    int cid = 0,
  }) async {
    final List<ArticleData> projectsTotal = [];
    Map projectList = {};
    try {
      projectList = await ProjectApi.projectList(page: page, cid: cid);
      List<ArticleData> articles = List<Map>.from(
        projectList['datas'],
      ).map((dynamic e) => ArticleData.fromJson(e)).toList();
      projectsTotal.addAll(articles);
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
    return ArticleListData(
      datas: projectsTotal,
      pageCount: projectList['pageCount'],
      curPage: projectList['curPage'],
    );
  }
}
