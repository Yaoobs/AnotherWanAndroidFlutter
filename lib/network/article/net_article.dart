import 'package:anotherwanandroidflutter/network/common/net_manager.dart';

import 'net_article_path.dart';

class AWAArticleNetManager {
  // 首页banner图
  static Future<List> bannerList() async {
    Map<String, dynamic> queryParameters = {};

    List list = await AWANetManager.get<List>(
      net_article_path_banner,
      queryParameters: queryParameters,
    );
    return list;
  }

  // 置顶文章列表
  static Future<List> topArticleList() async {
    Map<String, dynamic> queryParameters = {};

    List list = await AWANetManager.get<List>(
      net_article_path_toparticle_list,
      queryParameters: queryParameters,
    );
    return list;
  }

  // 首页文章列表
  static Future<Map> articleList({int page}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
    };

    Map map = await AWANetManager.get<Map>(
      "/article/list/" + "${page ?? 0}" + "/json",
      queryParameters: queryParameters,
    );
    return map;
  }
}
