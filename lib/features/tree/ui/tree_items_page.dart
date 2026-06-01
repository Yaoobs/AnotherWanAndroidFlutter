import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_items_list_page.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//创建Provider来管理当前选中的索引
final selectedIndexProvider = StateProvider<int>((ref) => 0);

class TreeItemsPage extends ConsumerStatefulWidget {
  const TreeItemsPage({
    super.key,
    required this.tabs,
    required this.index,
    this.title,
  });

  final List<TreeNodeData> tabs;
  final int index;
  final String? title;

  @override
  ConsumerState createState() => _TreeItemPageState();
}

class _TreeItemPageState extends ConsumerState<TreeItemsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  List<Widget> tabViews = [];
  @override
  void initState() {
    super.initState();
    for (TreeNodeData tab in widget.tabs) {
      tabViews.add(TreeItemsListPage(params: {'page': 0, 'cid': tab.id}));
    }
    _tabController = TabController(
      vsync: this,
      length: tabViews.length,
      initialIndex: widget.index,
    );
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      length: widget.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.colorPrimary,
          title: Text(
            widget.title ?? widget.tabs[selectedIndex].name ?? "",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                context.push(Routes.search);
              },
            ),
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
                tabs: widget.tabs
                    .asMap()
                    .map(
                      (int index, TreeNodeData node) => MapEntry(
                        index,
                        Text(
                          node.name ?? "",
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
