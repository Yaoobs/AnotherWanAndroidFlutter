import 'package:anotherwanandroidflutter/network/common/net_manager.dart';
import 'package:flutter/material.dart';

import 'net_tree_path.dart';

class AWATreeNetManager {
  // 体系数据列表
  static Future<List> treeList() async {
    Map<String, dynamic> queryParameters = {};

    List list = await AWANetManager.get<List>(
      net_tree_path_list,
      queryParameters: queryParameters,
    );
    return list;
  }

  // 体系下文章
  static Future<Map> treeItems({int page, @required int cid}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
      'cid': cid,
    };

    Map map = await AWANetManager.get<Map>(
      "/article/list/" + "${page ?? 0}" + "/json",
      queryParameters: queryParameters,
    );
    return map;
  }
}
