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
  final List<ArticleData> _searchResults = [];
  final List<HotKeyData> _hotKeys = [];

  Future<List<HotKeyData>> getHotKeys() async {
    try {
      _hotKeys.clear();
      // 获取 hotKeys 数据
      List<HotKeyData> hotKeys = await SearchApi.hotKeys();
      _hotKeys.insertAll(0, hotKeys);
    } catch (e) {
      throw Exception('Failed to fetch hotKeys: $e');
    }
    return _hotKeys;
  }

  Future<ArticleListData> getSearchResults({
    int page = 0,
    String key = "",
  }) async {
    if (page == 0) {
      _searchResults.clear();
    }
    Map articleList = {};
    try {
      articleList = await SearchApi.searchArticle(page: page, key: key);
      List<ArticleData> articles = List<Map>.from(
        articleList['datas'],
      ).map((dynamic e) => ArticleData.fromJson(e)).toList();
      _searchResults.addAll(articles);
    } catch (e) {
      throw Exception('Failed to fetch searchResults: $e');
    }
    return ArticleListData(
      datas: _searchResults,
      pageCount: articleList['pageCount'],
      curPage: articleList['curPage'],
    );
  }
}
