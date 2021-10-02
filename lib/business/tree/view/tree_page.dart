import 'package:anotherwanandroidflutter/business/tree/bloc/tree_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TreePage extends StatefulWidget {
  TreePage({Key key,@required this.treeBloc}) : super(key: key);

  final TreeBloc treeBloc;

  final tabViews = <Widget>[
    Container(),
    Container(),
  ];

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> with SingleTickerProviderStateMixin{
  // TabController tabController;
@override
  void initState() {
    super.initState();
    // tabController = TabController(vsync: this, length: widget.tabViews.length)
    // ..addListener(() {
    //     // switch (tabController.index) {
    //         context.read<TreeBloc>()
    //                         .add(TreeEventSelectedIndexChanged(tabController.index));
    //       // }
    // });
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
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
//                为什么不直接Navigator.push(context,
//                   MaterialPageRoute(
//                      builder: (context) =>  SearchPage()))
//                  https://stackoverflow.com/questions/50124355/flutter-navigator-not-working

                        // navigatorKey.currentState
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return SearchPage(null);
                        // }));
                      })
                ],
                // title: _searchBar(),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      // controller: tabController,
                      onTap: (int index) {
                        context
                            .read<TreeBloc>()
                            .add(TreeEventSelectedIndexChanged(index));
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
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  // controller: tabController,
                  children: widget.tabViews,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
