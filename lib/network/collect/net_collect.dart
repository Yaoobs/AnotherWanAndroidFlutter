import 'package:anotherwanandroidflutter/network/common/net_manager.dart';

class AWACollectNetManager {
  // 收藏文章列表
  static Future<Map> collectList({int page}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
    };

    Map map = await AWANetManager.get<Map>(
      "/lg/collect/list/" + "${page ?? 0}" + "/json",
      queryParameters: queryParameters,
      // options: options,
    );
    return map;
  }

  // 收藏站内文章
  static Future<Map> collectArticle({int id}) async {
    Map<String, dynamic> queryParameters = {};

    Map map = await AWANetManager.post<Map>(
      "/lg/collect/" + "${id ?? 0}" + "/json",
      queryParameters: queryParameters,
    );
    return map;
  }

  // 取消收藏文章
  static Future<Map> uncollectArticle({int id}) async {
    Map<String, dynamic> queryParameters = {};

    Map map = await AWANetManager.post<Map>(
      "/lg/uncollect_originId/" + "${id ?? 0}" + "/json",
      queryParameters: queryParameters,
    );
    return map;
  }
}
