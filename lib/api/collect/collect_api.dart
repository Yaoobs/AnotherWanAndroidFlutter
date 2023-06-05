import 'package:anotherwanandroidflutter/libs/http/http_manager.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';

class CollectApi {
  // 收藏文章列表
  static Future<List<ArticleData>> collectList({int? page}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
    };

    return HttpManager.get(
      "/lg/collect/list/" + "${page ?? 0}" + "/json",
      params: queryParameters,
    ).then((json) => List<Map>.from(json['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList());
  }

  // 收藏站内文章
  static Future<Null> collectArticle({int? id}) async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.post(
      "/lg/collect/" + "${id ?? 0}" + "/json",
      params: queryParameters,
    ).then((json) => null);
  }

  // 取消收藏文章(文章列表)
  static Future<Null> uncollectArticle(
      {int? id, bool ownCollect = false}) async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.post(
      "/lg" +
          "${ownCollect ? '/uncollect/' : '/uncollect_originId/'}" +
          "${id ?? 0}" +
          "/json",
      params: queryParameters,
    ).then((json) => null);
  }
}
