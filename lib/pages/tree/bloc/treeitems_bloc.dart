import 'package:anotherwanandroidflutter/api/tree/tree_api.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'treeitems_event.dart';
part 'treeitems_state.dart';

class TreeItemsBloc extends Bloc<TreeItemsEvent, TreeItemsState> {
  TreeItemsBloc() : super(TreeItemsState()) {
    on<SelectedIndexChanged>(
        (event, emit) => _onSelectedIndexChanged(event, emit));
    on<GetItemData>((event, emit) => _onGetItemData(event, emit));
  }

  _onSelectedIndexChanged(
    TreeItemsEvent event,
    Emitter<TreeItemsState> emit,
  ) {
    emit(state.copyWith(
        selectedIndex: (event as SelectedIndexChanged).selectedIndex));
  }

  _onGetItemData(
    TreeItemsEvent event,
    Emitter<TreeItemsState> emit,
  ) async {
    // 获取 体系下文章
    Map params = (event as GetItemData).params;
    List<ArticleData> articles = await TreeApi.treeItems(
      page: params['page'],
      cid: params['cid'],
    );
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    emit(state.copyWith(
      articles: articles,
    ));
  }
}
