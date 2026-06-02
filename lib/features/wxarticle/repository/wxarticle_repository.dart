import 'package:anotherwanandroidflutter/api/wxarticle/wxarticle_api.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wxarticle_repository.g.dart';

@riverpod
Future<WxArticleRepository> wxArticleRepository(Ref ref) async {
  return WxArticleRepository();
}

class WxArticleRepository {
  WxArticleRepository();
  final List<ArticleData> _articlesTotal = [];
  final List<TreeNodeData> _articleChapters = [];

  Future<List<TreeNodeData>> getArticleChapters() async {
    try {
      _articleChapters.clear();
      // 获取 体系列表
      List<TreeNodeData> articleChapters = await WxArticleApi.wxArticleChapters();
      _articleChapters.insertAll(0, articleChapters);
    } catch (e) {
      throw Exception('Failed to fetch articleChapters: $e');
    }
    return _articleChapters;
  }

  Future<ArticleListData> getArticleList({
    int page = 0,
    int id = 0,
  }) async {
      if (page == 0) {
      _articlesTotal.clear();
    }
    Map articleList = {};
    try {
      articleList = await WxArticleApi.wxArticleList(
        page: page,
        id: id,
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
