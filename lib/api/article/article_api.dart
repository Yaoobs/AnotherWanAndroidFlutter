import 'package:anotherwanandroidflutter/api/article/article_api_path.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/http/http_manager.dart';

class ArticleApi {
  // 首页banner图
  // static Future<List<BannerData>> bannerList() async {
  //   Map<String, dynamic> queryParameters = {};

  //   return HttpManager.get(
  //     net_article_path_banner,
  //     params: queryParameters,
  //   ).then((json) => List<Map>.from(json)
  //       .map((dynamic e) => BannerData.fromJson(e))
  //       .toList());
  // }

  // 置顶文章列表
  static Future<List<ArticleData>> topArticleList() async {
    Map<String, dynamic> queryParameters = {};

    return HttpManager.get(
      net_article_path_toparticle_list,
      params: queryParameters,
    ).then((json) => List<Map>.from(json)
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList());
  }

  // 首页文章列表
  static Future<Map> articleList({int page = 0,int pageSize = 20}) async {
    Map<String, dynamic> queryParameters = {
      'page_size': pageSize,
    };
    return HttpManager.get(
      "/article/list/$page/json",
      params: queryParameters,
    ).then((json) => json);
  }
}
