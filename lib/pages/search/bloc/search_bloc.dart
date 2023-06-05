import 'package:anotherwanandroidflutter/api/search/search_api.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/hotkey_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchEventLoadHotKeys>(
        (event, emit) => _mapLoadDataToState(event, emit));
    on<SearchEventSearchAction>(
        (event, emit) => _mapSearchActionToState(event, emit));
  }

  _mapLoadDataToState(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    List<HotKeyData> hotKeys = await SearchApi.hotKeys();
    emit(state.copyWith(
      hotKeys: hotKeys,
    ));
  }

  _mapSearchActionToState(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    // 获取 首页文章列表
    Map params = (event as SearchEventSearchAction).params;
    List<ArticleData> articles = await SearchApi.searchArticle(
      page: params['page'],
      key: params['key'],
    );
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    emit(state.copyWith(
      articles: articles,
    ));
  }
}
