import 'package:anotherwanandroidflutter/libs/http/http_manager.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/tree_node_data.dart';

import 'project_api_path.dart';

class ProjectApi {
  // 项目分类
  static Future<List<TreeNodeData>> projectTree() async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.get(
      net_project_path_tree,
      params: queryParameters,
    ).then((json) => List<Map>.from(json)
        .map((dynamic e) => TreeNodeData.fromJson(e))
        .toList());
  }

  // 项目列表
  static Future<List<ArticleData>> projectList(
      {int? page, required int cid}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
      'cid': cid,
    };

    return HttpManager.get(
      "/project/list/" + "${page ?? 0}" + "/json",
      params: queryParameters,
    ).then((json) => List<Map>.from(json['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList());
  }
}
