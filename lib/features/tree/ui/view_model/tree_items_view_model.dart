import 'package:anotherwanandroidflutter/features/collect/repository/collect_repository.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:anotherwanandroidflutter/features/tree/repository/tree_list_repository.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/state/tree_items_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tree_items_view_model.g.dart';

@Riverpod(keepAlive: false)
class TreeItemsViewModel extends _$TreeItemsViewModel {
  late TreeListRepository _repository;
  late CollectRepository _collectRepository;
  @override
  FutureOr<TreeItemsState> build(int cid) async {
    _repository = await ref.watch(treeListRepositoryProvider.future);
    _collectRepository = await ref.watch(collectRepositoryProvider.future);
    ArticleListData articleDatas = await _repository.getItemData(cid: cid);
    return TreeItemsState(articles: articleDatas.datas ?? [], cid: cid);
  }

  Future<void> getItemData({int? cid, bool loadMore = false}) async {
    try {
      int page = 0;
      List<ArticleData> articlesTotal = [];
      if (loadMore) {
        articlesTotal = [...state.value?.articles ?? []];
        page = state.value?.page ?? 0;
        page++;
      }
      ArticleListData articleDatas = await _repository.getItemData(
        page: page,
        cid: cid ?? state.value?.cid ?? 0,
      );
      articlesTotal.addAll(articleDatas.datas ?? []);
      state = AsyncData(
        state.value!.copyWith(
          page: page,
          articles: articlesTotal,
          noMore: (articleDatas.curPage ?? 1) >= (articleDatas.pageCount ?? 1),
        ),
      );
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> toggleCollect(int articleId) async {
    bool currentCollectFlag =
        state.value?.articles
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
      final updatedArticles = currentState.articles.map((article) {
        if (article.id == articleId) {
          return article.copyWith(collect: collectFlag);
        }
        return article;
      }).toList();

      // 保留其他字段，只更新 articles
      return currentState.copyWith(articles: updatedArticles);
    });
  }
}
