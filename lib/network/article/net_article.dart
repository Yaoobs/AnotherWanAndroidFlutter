import 'package:anotherwanandroidflutter/network/common/net_manager.dart';

import 'net_article_path.dart';

class AWAArticleNetManager {
  // 首页banner 图的接口实现
  static Future<List> bannerList() async {
    Map<String, dynamic> queryParameters = {};

    List list = await AWANetManager.get<List>(
      net_article_path_banner,
      queryParameters: queryParameters,
    );
    return list;
  }

  // 首页文章列表
  static Future<Map> articleList({int page}) async {

    Map map = await AWANetManager.get<Map>(
      "/article/list/" + "${page ?? 0}" + "/json",
    );
    return map;
  }
}
