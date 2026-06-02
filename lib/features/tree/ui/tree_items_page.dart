import 'package:anotherwanandroidflutter/features/common/ui/base_tab_page.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_items_list_page.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TreeItemsPage extends BaseTabPage {
  const TreeItemsPage({
    super.key,
    required super.tabs,
    required super.index,
    super.title,
  });

  @override
  TreeItemPageState getState() => TreeItemPageState();
}

class TreeItemPageState extends BaseTabPageState<TreeItemsPage> {
  @override
  List<Widget>? getActions() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          context.push(Routes.search);
        },
      ),
    ];
  }

  @override
  List<String> getTabTitles() {
    return widget.tabs?.map((node) {
          return node.name ?? "";
        }).toList() ??
        [];
  }

  @override
  List<Widget> getTabViews() {
    return widget.tabs?.map((node) {
          return TreeItemsListPage(params: {'page': 0, 'cid': node.id});
        }).toList() ??
        [];
  }
}
