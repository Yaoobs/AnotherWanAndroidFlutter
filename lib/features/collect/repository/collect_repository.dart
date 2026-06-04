import 'package:anotherwanandroidflutter/api/collect/collect_api.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collect_repository.g.dart';

@riverpod
Future<CollectRepository> collectRepository(Ref ref) async {
  return CollectRepository();
}

class CollectRepository {
  CollectRepository();

  Future<ArticleListData> getCollectList({int page = 0}) async {
    final List<ArticleData> collectsTotal = [];
    Map collectList = {};
    try {
      collectList = await CollectApi.collectList(page: page);
      List<ArticleData> articles = List<Map>.from(
        collectList['datas'],
      ).map((dynamic e) => ArticleData.fromJson(e)).toList();
      collectsTotal.addAll(articles);
    } catch (e) {
      throw Exception('Failed to fetch collects: $e');
    }
    return ArticleListData(
      datas: collectsTotal,
      pageCount: collectList['pageCount'],
      curPage: collectList['curPage'],
    );
  }

  // 收藏站内文章
  Future<void> collectArticle({int id = 0}) async {
    try {
      await CollectApi.collectArticle(id: id);
    } catch (e) {
      throw Exception('Failed to collectArticle: $e');
    }
  }

    Future<void> uncollectArticleList({int id = 0}) async {
    try {
      await CollectApi.uncollectArticleList(id: id);
    } catch (e) {
      throw Exception('Failed to collectArticle: $e');
    }
  }
}
