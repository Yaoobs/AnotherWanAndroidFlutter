import 'package:anotherwanandroidflutter/network/common/net_manager.dart';

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
}
