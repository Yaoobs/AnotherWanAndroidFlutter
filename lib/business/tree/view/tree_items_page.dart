import 'package:anotherwanandroidflutter/business/tree/bloc/treeitems_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TreeItemsPage extends StatefulWidget {
  TreeItemsPage({Key key, @required this.treeItemsBloc, @required this.tabs})
      : super(key: key);

  final TreeItemsBloc treeItemsBloc;
  final List<String> tabs;
  static Route route(tabs) {
    return MaterialPageRoute<void>(
        builder: (_) =>
            TreeItemsPage(treeItemsBloc: TreeItemsBloc(), tabs: tabs));
  }

  @override
  _TreeItemPageState createState() => _TreeItemPageState();
}

class _TreeItemPageState extends State<TreeItemsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController = PageController();
  List<Widget> tabViews = [];
  @override
  void initState() {
    super.initState();
    for(String tab in widget.tabs) {
      tabViews.add(Container());
    }
    _tabController = TabController(vsync: this, length: tabViews.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.treeItemsBloc,
      child: BlocBuilder<TreeItemsBloc, TreeItemsState>(
        builder: (context, state) {
          return DefaultTabController(
            length: widget.tabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  widget.tabs[state.selectedIndex],
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
                            .read<TreeItemsBloc>()
                            .add(TreeItemsEventSelectedIndexChanged(index));
                        _pageController.jumpToPage(index);
                      },
                      isScrollable: true,
                      unselectedLabelColor: Colors.white60,
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: widget.tabs
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
                  children: tabViews,
                  onPageChanged: (index) {
                    context
                        .read<TreeItemsBloc>()
                        .add(TreeItemsEventSelectedIndexChanged(index));
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
