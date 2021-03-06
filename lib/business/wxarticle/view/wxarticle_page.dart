import 'package:anotherwanandroidflutter/business/tree/models/tree_node_data.dart';
import 'package:anotherwanandroidflutter/business/wxarticle/bloc/wxarticle_bloc.dart';
import 'package:anotherwanandroidflutter/business/wxarticle/view/wxarticle_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WxArticlePage extends StatefulWidget {
  WxArticlePage({Key key, @required this.wxArticleBloc}) : super(key: key);

  final WxArticleBloc wxArticleBloc;

  @override
  _WxArticlePageState createState() => _WxArticlePageState();
}

class _WxArticlePageState extends State<WxArticlePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  List<Widget> tabViews = [];
  @override
  void initState() {
    _loadData();
    super.initState();
    _tabController = TabController(vsync: this, length: 14);
    _pageController = PageController();
  }

  Future<void> _loadData() async {
    widget.wxArticleBloc.add(WxArticleEventLoadItems());

    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.wxArticleBloc,
      child: BlocBuilder<WxArticleBloc, WxArticleState>(
        builder: (context, state) {
          for (TreeNodeData tab in state.tabs) {
            tabViews.add(WxArticleListPage(
                wxArticleBloc: WxArticleBloc(),
                params: {'page': 0, 'id': tab.id}));
          }
          return state.tabs != null && state.tabs.length > 0
              ? DefaultTabController(
                  length: state.tabs.length,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text(
                        state.tabs[state.selectedIndex].name,
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
                              context.read<WxArticleBloc>().add(
                                  WxArticleEventSelectedIndexChanged(index));
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
                                .map((int index, TreeNodeData node) => MapEntry(
                                    index,
                                    Text(node.name,
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
                              .read<WxArticleBloc>()
                              .add(WxArticleEventSelectedIndexChanged(index));
                          _tabController.animateTo(index);
                        },
                      ),
                    ),
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
