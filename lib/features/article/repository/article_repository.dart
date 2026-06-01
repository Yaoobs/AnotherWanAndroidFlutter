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
  final List<ArticleData> _articlesTotal = [];
  final List<BannerData> _banners = [];

  Future<List<BannerData>> getBanners() async {
    try {
      _banners.clear();
      // 获取 banner 数据
      List<BannerData> banners = await ArticleApi.bannerList();
      _banners.insertAll(0, banners);
    } catch (e) {
      throw Exception('Failed to fetch banners: $e');
    }
    return _banners;
  }

  Future<ArticleListData> getArticleList({
    int page = 0,
    int pageSize = 20,
  }) async {
    if (page == 0) {
      _articlesTotal.clear();
      try {
        // 获取 置顶文章列表
        List<ArticleData> topArticles = await ArticleApi.topArticleList();
        _articlesTotal.insertAll(0, topArticles);
      } catch (e) {
        throw Exception('Failed to fetch top articles: $e');
      }
    }
    Map articleList = {};
    try {
      articleList = await ArticleApi.articleList(
        page: page,
        pageSize: pageSize,
      );
      List<ArticleData> articles = List<Map>.from(
        articleList['datas'],
      ).map((dynamic e) => ArticleData.fromJson(e)).toList();
      _articlesTotal.addAll(articles);
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
    return ArticleListData(
      datas: _articlesTotal,
      pageCount: articleList['pageCount'],
      curPage: articleList['curPage'],
    );
  }
}
