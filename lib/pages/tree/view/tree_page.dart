import 'package:anotherwanandroidflutter/pages/navi/bloc/navi_bloc.dart';
import 'package:anotherwanandroidflutter/pages/navi/navi_page.dart';
import 'package:anotherwanandroidflutter/pages/tree/bloc/tree_bloc.dart';
import 'package:anotherwanandroidflutter/pages/tree/bloc/treelist_bloc.dart';
import 'package:anotherwanandroidflutter/pages/tree/view/tree_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TreePage extends StatefulWidget {
  TreePage({Key? key, required this.treeBloc}) : super(key: key);

  final TreeBloc treeBloc;

  final tabViews = <Widget>[
    TreeListPage(
      treeListBloc: TreeListBloc(),
    ),
    NaviPage(naviBloc: NaviBloc()),
  ];

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tabViews.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.treeBloc,
      child: BlocBuilder<TreeBloc, TreeState>(
        builder: (context, state) {
          return DefaultTabController(
            length: state.tabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  '体系',
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.search), onPressed: () {})
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      controller: _tabController,
                      onTap: (int index) {
                        context
                            .read<TreeBloc>()
                            .add(TreeEventSelectedIndexChanged(index));
                        _pageController.jumpToPage(index);
                      },
                      isScrollable: true,
                      unselectedLabelColor: Colors.white60,
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: state.tabs
                          .asMap()
                          .map((int index, String title) => MapEntry(
                              index,
                              Text(title,
                                  style: TextStyle(
                                    color: state.selectedIndex == index
                                        ? Colors.white
                                        : Colors.white60,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ))))
                          .values
                          .toList(),
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: PageView(
                  // physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: widget.tabViews,
                  onPageChanged: (index) {
                    context
                        .read<TreeBloc>()
                        .add(TreeEventSelectedIndexChanged(index));
                    _tabController.animateTo(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
