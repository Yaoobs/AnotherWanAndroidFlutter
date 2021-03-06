import 'package:anotherwanandroidflutter/business/article/widgets/article_list.dart';
import 'package:anotherwanandroidflutter/business/collect/bloc/collect_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class CollectListPage extends StatefulWidget {
  const CollectListPage({Key key, this.params, @required this.collectBloc})
      : super(key: key);
  final CollectBloc collectBloc;
  final Map params;

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) =>
            CollectListPage(collectBloc: CollectBloc(), params: {'page': 0}));
  }

  @override
  _CollectListPageState createState() => _CollectListPageState();
}

class _CollectListPageState extends State<CollectListPage> {
  @override
  void initState() {
    _loadData(widget.params);
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
    widget.collectBloc.add(CollectEventLoadData(params: params));

    await Future.delayed(Duration(seconds: 2));
  }
}
