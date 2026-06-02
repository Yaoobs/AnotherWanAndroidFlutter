import 'package:anotherwanandroidflutter/features/common/ui/base_tab_page.dart';
import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_items_list_page.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//创建Provider来管理当前选中的索引
// 定义 family provider，接收初始索引参数
final selectedIndexProvider = StateProvider.family<int, int>((
  ref,
  initialIndex,
) {
  return initialIndex;
});

class TreeItemsPage extends BaseTabPage {
  const TreeItemsPage({
    super.key,
    required this.tabs,
    required super.index,
    super.title,
  });

  final List<TreeNodeData>? tabs;

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
      debugPrint("22222222  ${node.id}");
          return TreeItemsListPage(params: {'page': 0, 'cid': node.id});
        }).toList() ??
        [];
  }

  @override
  StateProviderFamily<int, int> getStateProvider() {
    return selectedIndexProvider;
  }
}
