import 'package:anotherwanandroidflutter/features/collect/repository/collect_repository.dart';
import 'package:anotherwanandroidflutter/features/collect/ui/state/collect_list_state.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collect_list_view_model.g.dart';

@Riverpod(keepAlive: false)
class CollectListViewModel extends _$CollectListViewModel {
  late CollectRepository _repository;
  @override
  FutureOr<CollectListState> build() async {
    _repository = await ref.watch(collectRepositoryProvider.future);
    ArticleListData articleDatas = await _repository.getCollectList();
    return CollectListState(articles: articleDatas.datas ?? []);
  }

  Future<void> getCollectList({bool loadMore = false}) async {
    try {
      int page = 1;
      List<ArticleData> articlesTotal = [];
      if (loadMore) {
        articlesTotal = [...state.value?.articles ?? []];
        page = state.value?.page ?? 1;
        page++;
      }
      ArticleListData articleDatas = await _repository.getCollectList(
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
}
