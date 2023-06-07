import 'package:anotherwanandroidflutter/models/tree_node_data.dart';
import 'package:anotherwanandroidflutter/pages/tree/bloc/treelist_bloc.dart';
import 'package:anotherwanandroidflutter/pages/tree/view/tree_items_page.dart';
import 'package:anotherwanandroidflutter/pages/tree/widgets/treelist_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TreeListPage extends StatefulWidget {
  final TreeListBloc treeListBloc = TreeListBloc();

  @override
  _TreeListPageState createState() => _TreeListPageState();
}

class _TreeListPageState extends State<TreeListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => widget.treeListBloc,
      child: BlocBuilder<TreeListBloc, TreeListState>(
        builder: (BuildContext context, TreeListState state) {
          return ListView.builder(
            itemCount: state.nodeDatas.length,
            itemBuilder: (BuildContext context, int index) {
              return TreeListCell(
                  index: index,
                  nodeDatas: state.nodeDatas,
                  onPressed: (i) {
                    List<TreeNodeData> nodes =
                        List<Map>.from(state.nodeDatas[index].children!)
                            .map((dynamic e) => TreeNodeData.fromJson(e))
                            .toList();
                    Navigator.of(context).push(TreeItemsPage.route(nodes, i));
                  });
            },
          );
        },
      ),
    );
  }

  Future<void> _loadData() async {
    widget.treeListBloc.add(GetTreeList());

    await Future.delayed(Duration(seconds: 2));
  }
}
