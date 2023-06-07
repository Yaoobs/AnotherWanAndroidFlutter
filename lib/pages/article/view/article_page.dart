import 'package:anotherwanandroidflutter/common/application.dart';
import 'package:anotherwanandroidflutter/pages/article/bloc/article_bloc.dart';
import 'package:anotherwanandroidflutter/pages/article/widgets/article_list.dart';
import 'package:anotherwanandroidflutter/pages/article/widgets/image_banner.dart';
import 'package:anotherwanandroidflutter/pages/article/widgets/sep_divider.dart';
import 'package:anotherwanandroidflutter/router/routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key}) : super(key: key);
  final Map params = {'page': 0};
  final ArticleBloc articleBloc = ArticleBloc();

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // 加载Banner
    widget.articleBloc.add(GetBannerData());
    // 加载文章
    _loadData(widget.params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => widget.articleBloc,
      child: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (BuildContext context, ArticleState state) {
          List<Widget> slivers = [];
          slivers.addAll(_sliversFromState(state));
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  '首页',
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Application.router.navigateTo(context, Routes.search);
                      })
                ],
              ),
              body: EasyRefresh.custom(
                header: BallPulseHeader(),
                footer: null,
                slivers: slivers,
                onRefresh: () async {
                  widget.params['page'] = 0;
                  await _loadData(widget.params);
                },
                onLoad: () async {
                  widget.params['page'] = (widget.params['page'] ?? 0) + 1;
                  await _loadData(widget.params);
                },
              ));
        },
      ),
    );
  }

  Future<void> _loadData(Map params) async {
    widget.articleBloc.add(GetArticleData(params: params));

    await Future.delayed(Duration(seconds: 2));
  }

  List<Widget> _sliversFromState(ArticleState state) {
    List<Widget> slivers = [];

    // 添加 banner
    slivers.add(SliverToBoxAdapter(
      child: ImageBanner(
        banners: state.banners,
      ),
    ));

    slivers.add(ArticleList(
      articles: state.articles,
      onClickCollect: (id) {
        // widget.articleBloc.collect(id);
      },
    ));
    slivers.add(SliverToBoxAdapter(
      child: state.noMore
          ? SepDivider(
              text: Text('人家也是有底线的',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                  )),
            )
          : Container(),
    ));
    return slivers;
  }
}
