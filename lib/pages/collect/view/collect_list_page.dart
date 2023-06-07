import 'package:anotherwanandroidflutter/pages/article/widgets/article_list.dart';
import 'package:anotherwanandroidflutter/pages/collect/bloc/collect_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class CollectListPage extends StatefulWidget {
  final CollectBloc collectBloc = CollectBloc();
  final Map? params = {'page': 0};

  @override
  _CollectListPageState createState() => _CollectListPageState();
}

class _CollectListPageState extends State<CollectListPage> {
  @override
  void initState() {
    _loadData(widget.params!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.collectBloc,
      child: BlocBuilder<CollectBloc, CollectState>(
        builder: (BuildContext context, CollectState state) {
          List<Widget> slivers = [];
          slivers.add(ArticleList(
            articles: state.articles,
          ));
          return Scaffold(
              appBar: AppBar(
                  title: Text(
                '收藏',
                style: TextStyle(color: Colors.white),
              )),
              body: EasyRefresh.custom(
                header: BallPulseHeader(),
                footer: null,
                slivers: slivers,
                onRefresh: () async {
                  widget.params!['page'] = 0;
                  await _loadData(widget.params!);
                },
                onLoad: () async {
                  widget.params!['page'] = (widget.params!['page'] ?? 0) + 1;
                  await _loadData(widget.params!);
                },
              ));
        },
      ),
    );
  }

  Future<void> _loadData(Map params) async {
    widget.collectBloc.add(GetCollectData(params: params));

    await Future.delayed(Duration(seconds: 2));
  }
}
