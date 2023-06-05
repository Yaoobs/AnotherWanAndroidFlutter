import 'package:anotherwanandroidflutter/api/wxarticle/wxarticle_api.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/tree_node_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wxarticle_event.dart';
part 'wxarticle_state.dart';

class WxArticleBloc extends Bloc<WxArticleEvent, WxArticleState> {
  WxArticleBloc() : super(WxArticleState()) {
    on<WxArticleEventSelectedIndexChanged>(
        (event, emit) => _mapSelectedIndexChangedToState(event, emit));
    on<WxArticleEventLoadItems>(
        (event, emit) => _mapLoadItemsToState(event, emit));
    on<WxArticleEventLoadData>(
        (event, emit) => _mapLoadDataToState(event, emit));
  }

  _mapSelectedIndexChangedToState(
    WxArticleEvent event,
    Emitter<WxArticleState> emit,
  ) {
    emit(state.copyWith(
        selectedIndex:
            (event as WxArticleEventSelectedIndexChanged).selectedIndex));
  }

  _mapLoadItemsToState(
    WxArticleEvent event,
    Emitter<WxArticleState> emit,
  ) async {
    // 获取 体系列表
    List<TreeNodeData> tabs = await WxArticleApi.wxArticleChapters();
    emit(state.copyWith(
      tabs: tabs,
    ));
  }

  _mapLoadDataToState(
    WxArticleEvent event,
    Emitter<WxArticleState> emit,
  ) async {
    // 获取 体系下文章
    Map params = (event as WxArticleEventLoadData).params;
    List<ArticleData> articles = await WxArticleApi.wxArticleList(
      page: params['page'],
      id: params['id'],
    );
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    emit(state.copyWith(
      articles: articles,
    ));
  }
}
