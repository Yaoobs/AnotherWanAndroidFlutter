import 'dart:async';

import 'package:anotherwanandroidflutter/business/article/models/bannerdata.dart';
import 'package:anotherwanandroidflutter/network/article/net_article.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleState());

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if (event is ArticleEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  Stream<ArticleState> _mapLoadDataToState(
    ArticleEvent event,
    ArticleState state,
  ) async* {
    // 获取 banner 数据
    List list = await AWAArticleNetManager.bannerList();
    List<BannerData> banners =
        List<Map>.from(list).map((e) => BannerData.fromJson(e)).toList();
    yield state.copyWith(banners: banners);
  }
}
