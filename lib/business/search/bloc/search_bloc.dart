import 'dart:async';

import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/business/search/models/hotkey_data.dart';
import 'package:anotherwanandroidflutter/network/search/net_search.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchEventLoadHotKeys) {
      yield* _mapLoadDataToState(event, state);
    } else if (event is SearchEventSearchAction) {
      yield* _mapSearchActionToState(event, state);
    }
  }

  Stream<SearchState> _mapLoadDataToState(
    SearchEvent event,
    SearchState state,
  ) async* {
    List list = await AWASearchNetManager.hotKeys();
    List<HotKeyData> hotKeys = List<Map>.from(list)
        .map((dynamic e) => HotKeyData.fromJson(e))
        .toList();
    yield state.copyWith(
      hotKeys: hotKeys,
    );
  }

  Stream<SearchState> _mapSearchActionToState(
    SearchEvent event,
    SearchState state,
  ) async* {
    // 获取 首页文章列表
    Map params = (event as SearchEventSearchAction).params;
    Map articleList = await AWASearchNetManager.searchArticle(
      page: params['page'],
      key: params['key'],
    );
    List<ArticleData> articles = List<Map>.from(articleList['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList();
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    yield state.copyWith(
      articles: articles,
    );
  }
}
