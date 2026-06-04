import 'package:anotherwanandroidflutter/features/article/model/banner_data.dart';
import 'package:anotherwanandroidflutter/features/article/repository/article_repository.dart';
import 'package:anotherwanandroidflutter/features/article/ui/state/article_state.dart';
import 'package:anotherwanandroidflutter/features/collect/repository/collect_repository.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart'
    show ArticleData;
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_view_model.g.dart';

@Riverpod(keepAlive: false)
class ArticleViewModel extends _$ArticleViewModel {
  late ArticleRepository _repository;
  late CollectRepository _collectRepository;
  @override
  Future<ArticleState> build() async {
    _repository = await ref.watch(articleRepositoryProvider.future);
    _collectRepository = await ref.watch(collectRepositoryProvider.future);
    try {
      return _loadArticles();
    } catch (error) {
      return ArticleState(articles: [], banners: []);
    }
  }

  Future<ArticleState> _loadArticles() async {
    try {
      ArticleListData articleDatas = await _repository.getArticleList();
      List<BannerData> banners = await _repository.getBanners();
      return ArticleState(articles: articleDatas.datas ?? [], banners: banners);
    } catch (error) {
      throw Exception('Unexpected exception');
    }
  }

  Future<void> loadMoreArticles() async {
    try {
      List<ArticleData> articlesTotal = [...state.value?.articles ?? []];
      int page = state.value?.page ?? 0;
      page++;
      ArticleListData articleDatas = await _repository.getArticleList(
        page: page,
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
