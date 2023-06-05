import 'package:anotherwanandroidflutter/libs/http/http_manager.dart';
import 'navi_api_path.dart';

class NaviApi {
  // 体系数据列表
  static Future<List> naviList() async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.get(
      net_navi_path_list,
      params: queryParameters,
    ).then((json) => List<Map>.from(json).toList());
  }
}
