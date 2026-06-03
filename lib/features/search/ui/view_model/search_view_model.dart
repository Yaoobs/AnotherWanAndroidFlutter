import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:anotherwanandroidflutter/features/search/model/hotkey_data.dart';
import 'package:anotherwanandroidflutter/features/search/repository/search_repository.dart';
import 'package:anotherwanandroidflutter/features/search/ui/state/search_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_view_model.g.dart';

@Riverpod(keepAlive: false)
class SearchViewModel extends _$SearchViewModel {
  late SearchRepository _repository;
  @override
  FutureOr<SearchState> build() async {
    _repository = await ref.watch(searchRepositoryProvider.future);
    List<HotKeyData> hotKeys = await _repository.getHotKeys();
    return SearchState(hotKeys: hotKeys);
  }

  Future<void> getHotKeys() async {
    try {
      List<HotKeyData> hotKeys = await _repository.getHotKeys();
      state = AsyncData(state.value!.copyWith(hotKeys: hotKeys));
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  void clearSearchResults() {
    state = AsyncData(
      state.value!.copyWith(
        hotKeys: state.value?.hotKeys ?? [],
        searchResults: [],
      ),
    );
  }

  Future<void> getSearchResults({
    required String key,
    bool loadMore = false,
  }) async {
    try {
      int page = 0;
      List<ArticleData> searchResults = [];
      if (loadMore) {
        searchResults = [...state.value?.searchResults ?? []];
        page = state.value?.page ?? 0;
        page++;
      }
      ArticleListData articleDatas = await _repository.getSearchResults(
        page: page,
        key: key,
      );
      searchResults.addAll(articleDatas.datas ?? []);
      state = AsyncData(
        state.value!.copyWith(
          page: page,
          searchResults: searchResults,
          noMore: (articleDatas.curPage ?? 1) >= (articleDatas.pageCount ?? 1),
        ),
      );
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
