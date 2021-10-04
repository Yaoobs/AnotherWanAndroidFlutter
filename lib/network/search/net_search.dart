import 'package:anotherwanandroidflutter/network/common/net_manager.dart';

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
}
