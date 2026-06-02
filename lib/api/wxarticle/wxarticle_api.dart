import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:anotherwanandroidflutter/http/http_manager.dart';

import 'wxarticle_api_path.dart';

class WxArticleApi {
  // 公众号分类
  static Future<List<TreeNodeData>> wxArticleChapters() async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.get(
      net_wxarticle_path_chapters,
      params: queryParameters,
    ).then(
      (json) => List<Map>.from(
        json,
      ).map((dynamic e) => TreeNodeData.fromJson(e)).toList(),
    );
  }

  // 公众号文章列表
  static Future<Map> wxArticleList({int page = 0, required int id}) async {
    Map<String, dynamic> queryParameters = {'page_size': 20};

    return HttpManager.get(
      "/wxarticle/list/$id/$page/json",
      params: queryParameters,
    ).then((json) => json);
  }
}
