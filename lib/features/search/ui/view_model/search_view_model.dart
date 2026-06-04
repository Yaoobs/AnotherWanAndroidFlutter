import 'package:anotherwanandroidflutter/features/collect/repository/collect_repository.dart';
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
  late CollectRepository _collectRepository;
  @override
  FutureOr<SearchState> build() async {
    _repository = await ref.watch(searchRepositoryProvider.future);
    _collectRepository = await ref.watch(collectRepositoryProvider.future);
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

  Future<void> toggleCollect(int articleId) async {
    bool currentCollectFlag =
        state.value?.searchResults
            .firstWhere((article) => article.id == articleId)
            .collect ??
        false;
    // 乐观更新
    final nextCollectFlag = !currentCollectFlag;
    updateArticleCollectStatus(articleId, nextCollectFlag);

    try {
      if (nextCollectFlag) {
        await _collectRepository.collectArticle(id: articleId);
      } else {
        await _collectRepository.uncollectArticleList(id: articleId);
      }
    } catch (error) {
      // 回滚
      updateArticleCollectStatus(articleId, currentCollectFlag);
      rethrow;
    }
  }

  // 更新单个文章的收藏状态
  void updateArticleCollectStatus(int articleId, bool collectFlag) {
    state = state.whenData((currentState) {
      // 更新 articles 列表
      final updatedArticles = currentState.searchResults.map((article) {
        if (article.id == articleId) {
          return article.copyWith(collect: collectFlag);
        }
        return article;
      }).toList();

      // 保留其他字段，只更新 articles
      return currentState.copyWith(searchResults: updatedArticles);
    });
  }
}
