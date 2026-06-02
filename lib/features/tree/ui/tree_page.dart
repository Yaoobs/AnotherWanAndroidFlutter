import 'package:anotherwanandroidflutter/features/common/ui/base_tab_page.dart';
import 'package:anotherwanandroidflutter/features/navi/ui/navi_page.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_list_page.dart';
import 'package:flutter/material.dart';

class TreePage extends BaseTabPage {
  const TreePage({super.key, super.tabs, super.title});

  @override
  TreePageState getState() => TreePageState();
}

class TreePageState extends BaseTabPageState<TreePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  List<String> getTabTitles() {
    return const ['体系', '导航'];
  }

  @override
  List<Widget> getTabViews() {
    return <Widget>[TreeListPage(), NaviPage()];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildView();
  }
}
