import 'package:anotherwanandroidflutter/features/search/model/hotkey_data.dart';
import 'package:anotherwanandroidflutter/http/http_manager.dart';

import 'search_api_path.dart';

class SearchApi {
  // 搜索热词
  static Future<List<HotKeyData>> hotKeys() async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.get(
      net_search_path_hotkey,
      params: queryParameters,
    ).then(
      (json) => List<Map>.from(
        json,
      ).map((dynamic e) => HotKeyData.fromJson(e)).toList(),
    );
  }

  // 搜索文章列表
  static Future<Map> searchArticle({required String key, int page = 0}) async {
    Map<String, dynamic> queryParameters = {'page_size': 20, 'k': key};
    return HttpManager.post(
      "/article/query/$page/json",
      params: queryParameters,
    ).then((json) => json);
  }
}
