import 'package:anotherwanandroidflutter/network/common/net_manager.dart';
import 'package:flutter/material.dart';

import 'net_wxarticle_path.dart';

class AWAWxArticleNetManager {
  // 公众号分类
  static Future<List> wxArticleChapters() async {
    Map<String, dynamic> queryParameters = {};

    List list = await AWANetManager.get<List>(
      net_wxarticle_path_chapters,
      queryParameters: queryParameters,
    );
    return list;
  }

  // 公众号文章列表
  static Future<Map> wxArticleList({int page, @required int id}) async {
    Map<String, dynamic> queryParameters = {'page_size': 20};

    Map map = await AWANetManager.get<Map>(
      "/wxarticle/list/" + "${id ?? 0}" + "/${page ?? 0}" + "/json",
      queryParameters: queryParameters,
    );
    return map;
  }
}
