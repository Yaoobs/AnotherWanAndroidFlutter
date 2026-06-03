import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:anotherwanandroidflutter/features/tree/repository/tree_list_repository.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/state/tree_items_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tree_items_view_model.g.dart';

@Riverpod(keepAlive: false)
class TreeItemsViewModel extends _$TreeItemsViewModel {
  late TreeListRepository _repository;
  @override
  FutureOr<TreeItemsState> build(int cid) async {
    _repository = await ref.watch(treeListRepositoryProvider.future);
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
}
