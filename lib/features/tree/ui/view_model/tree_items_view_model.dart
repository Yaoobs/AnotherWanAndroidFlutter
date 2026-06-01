import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:anotherwanandroidflutter/features/tree/repository/tree_list_repository.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/state/tree_items_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tree_items_view_model.g.dart';

@Riverpod(keepAlive: true)
class TreeItemsViewModel extends _$TreeItemsViewModel {
  late TreeListRepository _repository;
  @override
  FutureOr<TreeItemsState> build() async {
    _repository = await ref.watch(treeListRepositoryProvider.future);
     ArticleListData articleDatas = await _repository.getItemData();
    return TreeItemsState(articles: articleDatas.datas ?? []);
  }


  Future<void> getItemData({
    required int cid,
    bool loadMore = false,
  }) async {
    try {
      int page = 0;
      if (loadMore) {
        page = state.value?.page ?? 0;
        page++;
      }
      ArticleListData articleDatas = await _repository.getItemData(
        page: page,
        cid: cid,
      );
      state = AsyncData(
        TreeItemsState(
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
