import 'package:anotherwanandroidflutter/api/article/article_api.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/banner_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleState()) {
    on<ArticleEventLoadData>((event, emit) => _mapLoadDataToState(event, emit));
  }

  _mapLoadDataToState(ArticleEvent event, Emitter<ArticleState> emit) async {
    // 获取 banner 数据
    List<BannerData> banners = await ArticleApi.bannerList();
    // 获取 置顶文章列表
    List<ArticleData> topArticles = await ArticleApi.topArticleList();

    // 获取 首页文章列表
    Map params = (event as ArticleEventLoadData).params;
    Map articleList = await ArticleApi.articleList(
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
    emit(state.copyWith(
      banners: banners,
      articles: articles,
      noMore: (articleList['curPage'] ?? 1) >= (articleList['pageCount'] ?? 1),
    ));
  }
}
