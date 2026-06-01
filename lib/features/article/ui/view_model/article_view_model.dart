import 'package:anotherwanandroidflutter/features/article/repository/article_repository.dart';
import 'package:anotherwanandroidflutter/features/article/ui/state/article_state.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_view_model.g.dart';

@Riverpod(keepAlive: true)
class ArticleViewModel extends _$ArticleViewModel {
  late ArticleRepository _repository;
  @override
  FutureOr<ArticleState> build() async {
    _repository = await ref.watch(articleRepositoryProvider.future);
    ArticleListData articleDatas = await _repository.getArticleList();
    return ArticleState(articles: articleDatas.datas ?? []);
  }

  Future<void> refreshArticles() async {
    try {
      ArticleListData articleDatas = await _repository.getArticleList();
      state = AsyncData(ArticleState(articles: articleDatas.datas ?? []));
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> loadMoreArticles() async {
    try {
      int page = state.value?.page ?? 0;
      page++;
      ArticleListData articleDatas = await _repository.getArticleList(
        page: page,
      );
      state = AsyncData(
        ArticleState(
          page: page,
          articles: articleDatas.datas ?? [],
          noMore: (articleDatas.curPage ?? 1) >= (articleDatas.pageCount ?? 1),
        ),
      );
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
