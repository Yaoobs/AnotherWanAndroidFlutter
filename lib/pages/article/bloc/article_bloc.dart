import 'package:anotherwanandroidflutter/api/article/article_api.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/banner_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleState()) {
    on<GetBannerData>((event, emit) => _getBanners(emit));
    on<GetArticleData>((event, emit) => _getArticleList(event, emit));
  }

  _getBanners(Emitter<ArticleState> emit) async {
    // 获取 banner 数据
    List<BannerData> banners = await ArticleApi.bannerList();
    emit(state.copyWith(banners: banners));
  }

  _getArticleList(ArticleEvent event, Emitter<ArticleState> emit) async {
    // 获取 置顶文章列表
    List<ArticleData> topArticles = await ArticleApi.topArticleList();

    // 获取 首页文章列表
    Map params = (event as GetArticleData).params;
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
      articles: articles,
      noMore: (articleList['curPage'] ?? 1) >= (articleList['pageCount'] ?? 1),
    ));
  }
}
