import 'dart:async';

import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/business/tree/models/tree_node_data.dart';
import 'package:anotherwanandroidflutter/network/wxarticle/net_wxarticle.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wxarticle_event.dart';
part 'wxarticle_state.dart';

class WxArticleBloc extends Bloc<WxArticleEvent, WxArticleState> {
  WxArticleBloc() : super(WxArticleState());

  @override
  Stream<WxArticleState> mapEventToState(
    WxArticleEvent event,
  ) async* {
    if (event is WxArticleEventSelectedIndexChanged) {
      yield _mapSelectedIndexChangedToState(event, state);
    } else if(event is WxArticleEventLoadItems) {
      yield* _mapLoadItemsToState(event, state);
    } else if (event is WxArticleEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  WxArticleState _mapSelectedIndexChangedToState(
    WxArticleEvent event,
    WxArticleState state,
  ) {
    return state.copyWith(
        selectedIndex:
            (event as WxArticleEventSelectedIndexChanged).selectedIndex);
  }

    Stream<WxArticleState> _mapLoadItemsToState(
    WxArticleEvent event,
    WxArticleState state,
  ) async* {
    // 获取 体系列表
    List list = await AWAWxArticleNetManager.wxArticleChapters();
    List<TreeNodeData> tabs = List<Map>.from(list)
        .map((dynamic e) => TreeNodeData.fromJson(e))
        .toList();
    yield state.copyWith(
      tabs: tabs,
    );
  }

  Stream<WxArticleState> _mapLoadDataToState(
    WxArticleEvent event,
    WxArticleState state,
  ) async* {
    // 获取 体系下文章
    Map params = (event as WxArticleEventLoadData).params;
    Map articleList = await AWAWxArticleNetManager.wxArticleList(
      page: params['page'],
      id: params['id'],
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
