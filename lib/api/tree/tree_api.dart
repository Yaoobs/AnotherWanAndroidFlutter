import 'package:anotherwanandroidflutter/libs/http/http_manager.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/tree_node_data.dart';
import 'tree_api_path.dart';

class TreeApi {
  // 体系数据列表
  static Future<List<TreeNodeData>> treeList() async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.get(
      net_tree_path_list,
      params: queryParameters,
    ).then((json) => List<Map>.from(json)
        .map((dynamic e) => TreeNodeData.fromJson(e))
        .toList());
  }

  // 体系下文章
  static Future<List<ArticleData>> treeItems(
      {int? page, required int cid}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
      'cid': cid,
    };

    return HttpManager.get(
      "/article/list/" + "${page ?? 0}" + "/json",
      params: queryParameters,
    ).then((json) => List<Map>.from(json['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList());
  }
}
