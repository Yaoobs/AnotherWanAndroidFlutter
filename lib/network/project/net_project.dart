import 'package:anotherwanandroidflutter/network/common/net_manager.dart';
import 'package:flutter/material.dart';

import 'net_project_path.dart';

class AWAProjectNetManager {
  // 项目分类
  static Future<List> projectTree() async {
    Map<String, dynamic> queryParameters = {};

    List list = await AWANetManager.get<List>(
      net_project_path_tree,
      queryParameters: queryParameters,
    );
    return list;
  }

  // 项目列表
  static Future<Map> projectList({int page, @required int cid}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
      'cid': cid,
    };

    Map map = await AWANetManager.get<Map>(
      "/project/list/" + "${page ?? 0}" + "/json",
      queryParameters: queryParameters,
    );
    return map;
  }
}
