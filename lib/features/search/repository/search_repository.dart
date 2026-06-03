import 'package:anotherwanandroidflutter/api/search/search_api.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:anotherwanandroidflutter/features/search/model/hotkey_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository.g.dart';

@riverpod
Future<SearchRepository> searchRepository(Ref ref) async {
  return SearchRepository();
}

class SearchRepository {
  SearchRepository();

  Future<List<HotKeyData>> getHotKeys() async {
    final List<HotKeyData> hotKeys = [];
    try {
      // 获取 hotKeys 数据
      List<HotKeyData> results = await SearchApi.hotKeys();
      hotKeys.addAll(results);
    } catch (e) {
      throw Exception('Failed to fetch hotKeys: $e');
    }
    return hotKeys;
  }

  Future<ArticleListData> getSearchResults({
    int page = 0,
    String key = "",
  }) async {
    final List<ArticleData> searchResults = [];
    Map articleList = {};
    try {
      articleList = await SearchApi.searchArticle(page: page, key: key);
      List<ArticleData> articles = List<Map>.from(
        articleList['datas'],
      ).map((dynamic e) => ArticleData.fromJson(e)).toList();
      searchResults.addAll(articles);
    } catch (e) {
      throw Exception('Failed to fetch searchResults: $e');
    }
    return ArticleListData(
      datas: searchResults,
      pageCount: articleList['pageCount'],
      curPage: articleList['curPage'],
    );
  }
}
