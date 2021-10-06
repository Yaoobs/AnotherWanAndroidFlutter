import 'package:anotherwanandroidflutter/business/article/widgets/article_list.dart';
import 'package:anotherwanandroidflutter/business/wxarticle/bloc/wxarticle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class WxArticleListPage extends StatefulWidget {
  const WxArticleListPage({Key key, this.params, @required this.wxArticleBloc})
      : super(key: key);
  final WxArticleBloc wxArticleBloc;
  final Map params;

  @override
  _WxArticleListPageState createState() => _WxArticleListPageState();
}

class _WxArticleListPageState extends State<WxArticleListPage> {
  @override
  void initState() {
    _loadData(widget.params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.wxArticleBloc,
      child: BlocBuilder<WxArticleBloc, WxArticleState>(
        builder: (BuildContext context, WxArticleState state) {
          List<Widget> slivers = [];
          slivers.add(ArticleList(
            articles: state.articles,
          ));
          return EasyRefresh.custom(
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
          );
        },
      ),
    );
  }

  Future<void> _loadData(Map params) async {
    widget.wxArticleBloc.add(WxArticleEventLoadData(params: params));

    await Future.delayed(Duration(seconds: 2));
  }
}
