import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//创建Provider来管理当前选中的索引
final selectedIndexProvider = StateProvider<int>((ref) => 0);

class TreePage extends ConsumerStatefulWidget {
  const TreePage({super.key});

  @override
  ConsumerState createState() => TreePageState();
}

class TreePageState extends ConsumerState<TreePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  late PageController _pageController;
  List<Widget> tabViews = [];
  List<String> tabs = const ['体系', '导航'];
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    tabViews = <Widget>[TreeListPage(), Center(child: Text("2"))];
    _tabController = TabController(vsync: this, length: tabViews.length);
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 监听选中的索引
    final selectedIndex = ref.watch(selectedIndexProvider);
    // 监听索引变化，同步PageView
    ref.listen<int>(selectedIndexProvider, (previous, next) {
      if (previous != next) {
        _pageController.jumpToPage(next);
        _tabController.animateTo(next);
      }
    });
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.colorPrimary,
          title: Text('体系', style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                onTap: (index) => _onTabChanged(index),
                isScrollable: true,
                unselectedLabelColor: Colors.white60,
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: tabs
                    .asMap()
                    .map(
                      (int index, String title) => MapEntry(
                        index,
                        Text(
                          title,
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
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
            onPageChanged: (index) => _onTabChanged(index),
          ),
        ),
      ),
    );
  }

  void _onTabChanged(int index) {
    // 更新Provider中的索引
    ref.read(selectedIndexProvider.notifier).state = index;
  }
}
