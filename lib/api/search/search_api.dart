import 'package:anotherwanandroidflutter/libs/http/http_manager.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/hotkey_data.dart';
import 'search_api_path.dart';

class SearchApi {
  // 搜索热词
  static Future<List<HotKeyData>> hotKeys() async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.get(
      net_search_path_hotkey,
      params: queryParameters,
    ).then((json) => List<Map>.from(json)
        .map((dynamic e) => HotKeyData.fromJson(e))
        .toList());
  }

  // 首页文章列表
  static Future<List<ArticleData>> searchArticle(
      {required String key, int? page}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': 20,
      'k': key,
    };

    return HttpManager.post(
      "/article/query/" + "${page ?? 0}" + "/json",
      params: queryParameters,
    ).then((json) => List<Map>.from(json['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList());
  }
}
