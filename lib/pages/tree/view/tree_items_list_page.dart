import 'package:anotherwanandroidflutter/pages/article/widgets/article_list.dart';
import 'package:anotherwanandroidflutter/pages/tree/bloc/treeitems_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class TreeItemsListPage extends StatefulWidget {
  TreeItemsListPage({Key? key, required this.params}) : super(key: key);
  final TreeItemsBloc treeItemsBloc = TreeItemsBloc();
  final Map params;

  @override
  _TreeItemsListPageState createState() => _TreeItemsListPageState();
}

class _TreeItemsListPageState extends State<TreeItemsListPage> {
  @override
  void initState() {
    _loadData(widget.params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.treeItemsBloc,
      child: BlocBuilder<TreeItemsBloc, TreeItemsState>(
        builder: (BuildContext context, TreeItemsState state) {
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
    widget.treeItemsBloc.add(GetItemData(params: params));

    await Future.delayed(Duration(seconds: 2));
  }
}
