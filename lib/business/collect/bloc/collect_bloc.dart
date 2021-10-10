import 'dart:async';

import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/network/collect/net_collect.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'collect_event.dart';
part 'collect_state.dart';

class CollectBloc extends Bloc<CollectEvent, CollectState> {
  CollectBloc() : super(CollectState());

  @override
  Stream<CollectState> mapEventToState(
    CollectEvent event,
  ) async* {
    if (event is CollectEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  Stream<CollectState> _mapLoadDataToState(
    CollectEvent event,
    CollectState state,
  ) async* {
    // 获取 体系下文章
    Map params = (event as CollectEventLoadData).params;
    Map articleList = await AWACollectNetManager.collectList(
      page: params['page']
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
