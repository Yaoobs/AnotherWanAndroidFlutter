import 'dart:async';

import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/business/article/models/banner_data.dart';
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
    // 获取 置顶文章列表
    List topArticleList = await AWAArticleNetManager.topArticleList();
    List<ArticleData> topArticles = List<Map>.from(topArticleList)
        .map((e) => ArticleData.fromJson(e))
        .toList();

    // 获取 首页文章列表
    Map params = (event as ArticleEventLoadData).params;
    Map articleList = await AWAArticleNetManager.articleList(
      page: params['page'],
    );
    List<ArticleData> articles = List<Map>.from(articleList['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList();
    if (params['page'] == 0) {
      articles.insertAll(0, topArticles);
    }
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    yield state.copyWith(
      banners: banners,
      articles: articles,
      noMore: (articleList['curPage'] ?? 1) >= (articleList['pageCount'] ?? 1),
    );
  }
}
