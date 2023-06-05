import 'package:anotherwanandroidflutter/libs/http/http_manager.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/tree_node_data.dart';
import 'wxarticle_api_path.dart';

class WxArticleApi {
  // 公众号分类
  static Future<List<TreeNodeData>> wxArticleChapters() async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.get(
      net_wxarticle_path_chapters,
      params: queryParameters,
    ).then((json) => List<Map>.from(json)
        .map((dynamic e) => TreeNodeData.fromJson(e))
        .toList());
  }

  // 公众号文章列表
  static Future<List<ArticleData>> wxArticleList(
      {int? page, required int id}) async {
    Map<String, dynamic> queryParameters = {'page_size': 20};

    return HttpManager.get(
      "/wxarticle/list/" + "$id" + "/${page ?? 0}" + "/json",
      params: queryParameters,
    ).then((json) => List<Map>.from(json['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList());
  }
}
