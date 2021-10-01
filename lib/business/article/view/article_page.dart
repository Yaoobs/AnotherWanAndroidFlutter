import 'package:anotherwanandroidflutter/business/article/bloc/article_bloc.dart';
import 'package:anotherwanandroidflutter/business/article/widgets/image_banner.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

final ArticleBloc articleBloc = ArticleBloc();

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    articleBloc.add(ArticleEventLoadData());

    return BlocProvider(
      create: (context) => articleBloc,
      child: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (BuildContext context, ArticleState state) {
          List<Widget> slivers = [];
          slivers.addAll(_sliversFromState(state));
          return EasyRefresh.custom(
            header: BallPulseHeader(),
            footer: null,
            slivers: slivers,
            onRefresh: () async {
              await _loadData();
            },
            onLoad: null,
          );
        },
      ),
    );
  }

  Future<void> _loadData() async {
    articleBloc.add(ArticleEventLoadData());

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

    return slivers;
  }
}
