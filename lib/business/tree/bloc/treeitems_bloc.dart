import 'dart:async';

import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/network/tree/net_tree.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'treeitems_event.dart';
part 'treeitems_state.dart';

class TreeItemsBloc extends Bloc<TreeItemsEvent, TreeItemsState> {
  TreeItemsBloc() : super(TreeItemsState());

  @override
  Stream<TreeItemsState> mapEventToState(
    TreeItemsEvent event,
  ) async* {
    if (event is TreeItemsEventSelectedIndexChanged) {
      yield _mapSelectedIndexChangedToState(event, state);
    } else if (event is TreeItemsEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  TreeItemsState _mapSelectedIndexChangedToState(
    TreeItemsEvent event,
    TreeItemsState state,
  ) {
    return state.copyWith(
        selectedIndex:
            (event as TreeItemsEventSelectedIndexChanged).selectedIndex);
  }

  Stream<TreeItemsState> _mapLoadDataToState(
    TreeItemsEvent event,
    TreeItemsState state,
  ) async* {
    // 获取 体系下文章
    Map params = (event as TreeItemsEventLoadData).params;
    Map articleList = await AWATreeNetManager.treeItems(
      page: params['page'],
      cid: params['cid'],
    );
    List<ArticleData> articles = List<Map>.from(articleList['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList();
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    yield state.copyWith(
      articles: articles,
    );
  }
}
