import 'package:anotherwanandroidflutter/features/article/model/banner_data.dart';
import 'package:anotherwanandroidflutter/features/article/repository/article_repository.dart';
import 'package:anotherwanandroidflutter/features/article/ui/state/article_state.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_view_model.g.dart';

@Riverpod(keepAlive: false)
class ArticleViewModel extends _$ArticleViewModel {
  late ArticleRepository _repository;
  @override
  FutureOr<ArticleState> build() async {
    _repository = await ref.watch(articleRepositoryProvider.future);
    ArticleListData articleDatas = ArticleListData();
    List<BannerData> banners = [];
    try {
      articleDatas = await _repository.getArticleList();
      banners = await _repository.getBanners();
    } catch (error) {}
    return ArticleState(articles: articleDatas.datas ?? [], banners: banners);
  }

  Future<void> refreshArticles() async {
    try {
      ArticleListData articleDatas = await _repository.getArticleList();
      List<BannerData> banners = await _repository.getBanners();
      state = AsyncData(
        state.value!.copyWith(
          articles: articleDatas.datas ?? [],
          banners: banners,
        ),
      );
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
        state.value!.copyWith(
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
