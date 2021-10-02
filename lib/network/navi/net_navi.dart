import 'package:anotherwanandroidflutter/network/common/net_manager.dart';

import 'net_navi_path.dart';

class AWANaviNetManager {

  // 体系数据列表
  static Future<List> naviList() async {
    Map<String, dynamic> queryParameters = {};

    List list = await AWANetManager.get<List>(
      net_navi_path_list,
      queryParameters: queryParameters,
    );
    return list;
  }
}