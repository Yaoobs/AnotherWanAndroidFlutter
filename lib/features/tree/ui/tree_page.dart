import 'package:anotherwanandroidflutter/features/common/ui/base_tab_page.dart';
import 'package:anotherwanandroidflutter/features/navi/ui/navi_page.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_list_page.dart';
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

class TreePage extends BaseTabPage {
  const TreePage({super.key, super.title});

  @override
  TreePageState getState() => TreePageState();
}

class TreePageState extends BaseTabPageState<TreePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
    return const ['体系', '导航'];
  }

  @override
  List<Widget> getTabViews() {
    return <Widget>[TreeListPage(), NaviPage()];
  }

  @override
  StateProviderFamily<int, int> getStateProvider() {
    return selectedIndexProvider;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildView();
  }
}
