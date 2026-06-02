import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//创建Provider来管理当前选中的索引
// 定义 family provider，接收初始索引参数
final selectedIndexProvider = StateProvider.family<int, int>((
  ref,
  initialIndex,
) {
  return initialIndex;
});

abstract class BaseTabPage extends ConsumerStatefulWidget {
  const BaseTabPage({
    super.key,
    this.tabs,
    this.index = 0,
    this.title,
  });

  final List<TreeNodeData>? tabs;
  final int index;
  final String? title;

  @override
  // ignore: no_logic_in_create_state
  ConsumerState createState() => getState();

  BaseTabPageState getState();
}

abstract class BaseTabPageState<T extends BaseTabPage> extends ConsumerState<T>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  List<String> get tabTitles => getTabTitles();

  @protected
  List<String> getTabTitles();

  List<Widget> get tabViews => getTabViews();

  @protected
  List<Widget> getTabViews();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabViews.length);
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @protected
  List<Widget>? getActions() {
    return null;
  }

  Widget buildView() {
    // 监听选中的索引
    final selectedIndex = ref.watch(selectedIndexProvider(widget.index));
    // 监听索引变化，同步PageView
    ref.listen<int>(selectedIndexProvider(widget.index), (previous, next) {
      if (previous != next) {
        _pageController.jumpToPage(next);
        _tabController.animateTo(next);
      }
    });
    return DefaultTabController(
      length: tabViews.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.colorPrimary,
          title: Text(widget.title??"", style: TextStyle(color: Colors.white)),
          actions: getActions(),
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
                tabs: tabTitles
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

  @override
  Widget build(BuildContext context) {
    return buildView();
  }

  void _onTabChanged(int index) {
    // 更新Provider中的索引
    ref.read(selectedIndexProvider(widget.index).notifier).state = index;
  }
}
