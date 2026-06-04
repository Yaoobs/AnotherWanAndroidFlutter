import 'package:anotherwanandroidflutter/http/http_manager.dart';

class CollectApi {
  // 收藏文章列表
  static Future<Map> collectList({int page = 0}) async {
    Map<String, dynamic> queryParameters = {'page_size': 20};

    return HttpManager.get(
      "/lg/collect/list/$page/json",
      params: queryParameters,
    ).then((json) => json);
  }

  // 收藏站内文章
  static Future<Null> collectArticle({int id = 0}) async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.post(
      "/lg/collect/$id/json",
      params: queryParameters,
    ).then((json) => null);
  }

  // 取消收藏文章(文章列表)
  static Future<Null> uncollectArticleList({int id = 0}) async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.post(
      "/lg/uncollect_originId/$id/json",
      params: queryParameters,
    ).then((json) => null);
  }

  // 取消收藏文章(我的收藏)
  static Future<Null> uncollectArticleMyOwn({
    int id = 0,
    int originId = -1,
  }) async {
    Map<String, dynamic> queryParameters = {'originId': originId};

    return HttpManager.post(
      "/lg/uncollect/$id/json",
      params: queryParameters,
    ).then((json) => null);
  }
}
