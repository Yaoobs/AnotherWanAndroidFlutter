import 'package:anotherwanandroidflutter/api/article/article_api.dart';
import 'package:anotherwanandroidflutter/features/article/model/banner_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_repository.g.dart';

@riverpod
Future<ArticleRepository> articleRepository(Ref ref) async {
  return ArticleRepository();
}

class ArticleRepository {
  ArticleRepository();

  Future<List<BannerData>> getBanners() async {
    final List<BannerData> banners = [];
    try {
      // 获取 banner 数据
      List<BannerData> results = await ArticleApi.bannerList();
      banners.addAll(results);
    } catch (e) {
      throw Exception('Failed to fetch banners: $e');
    }
    return banners;
  }

  Future<ArticleListData> getArticleList({
    int page = 0,
    int pageSize = 20,
  }) async {
     final List<ArticleData> articlesTotal = [];
    if (page == 0) {
      try {
        // 获取 置顶文章列表
        List<ArticleData> topArticles = await ArticleApi.topArticleList();
        articlesTotal.addAll(topArticles);
      } catch (e) {
        throw Exception('Failed to fetch top articles: $e');
      }
    }
    Map articleListData = {};
    try {
      articleListData = await ArticleApi.articleList(
        page: page,
        pageSize: pageSize,
      );
      List<ArticleData> articles = List<Map>.from(
        articleListData['datas'],
      ).map((dynamic e) => ArticleData.fromJson(e)).toList();
      articlesTotal.addAll(articles);
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
    return ArticleListData(
      datas: articlesTotal,
      pageCount: articleListData['pageCount'],
      curPage: articleListData['curPage'],
    );
  }
}
