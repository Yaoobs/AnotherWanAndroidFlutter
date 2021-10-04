import 'package:anotherwanandroidflutter/network/common/net_manager.dart';
import 'package:flutter/material.dart';

import 'net_search_path.dart';

class AWASearchNetManager {
  // 搜索热词
  static Future<List> hotKeys() async {
    Map<String, dynamic> queryParameters = {};

    List list = await AWANetManager.get<List>(
      net_search_path_hotkey,
      queryParameters: queryParameters,
    );
    return list;
  }

  // 首页文章列表
  static Future<Map> searchArticle({@required String key, int page}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
      'k': key,
    };

    Map map = await AWANetManager.post<Map>(
      "/article/query/" + "${page ?? 0}" + "/json",
      queryParameters: queryParameters,
    );
    return map;
  }
}
