import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:anotherwanandroidflutter/features/article/ui/article_page.dart';
import 'package:anotherwanandroidflutter/features/project/ui/project_page.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/tree_page.dart';
import 'package:anotherwanandroidflutter/features/wxarticle/ui/wxarticle_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//创建Provider来管理当前选中的索引
final selectedIndexProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final PageController _pageController;
  List<String> appBarTitles = ['首页', '体系', '公众号', '项目', '我的'];

  List<BottomNavigationBarItem> bottomNavItems = [];

  final pages = [
    ArticleScreen(),
    TreePage(title: "体系"),
    WxArticlePage(title: "公众号"),
    ProjectPage(title: "项目"),
    Container(child: Center(child: Text("5"))),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    bottomNavItems = [
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: const Icon(AndotherFonts.home),
        activeIcon: const Icon(AndotherFonts.home_selected),
        label: appBarTitles[0],
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: const Icon(AndotherFonts.find),
        activeIcon: const Icon(AndotherFonts.find_selected),
        label: appBarTitles[1],
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: const Icon(AndotherFonts.wx),
        activeIcon: const Icon(AndotherFonts.wx_selected),
        label: appBarTitles[2],
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: const Icon(AndotherFonts.project),
        activeIcon: const Icon(AndotherFonts.project_selected),
        label: appBarTitles[3],
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: const Icon(AndotherFonts.my),
        activeIcon: const Icon(AndotherFonts.my_selected),
        label: appBarTitles[4],
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 监听选中的索引
    final selectedIndex = ref.watch(selectedIndexProvider);

    // 监听索引变化，同步PageView
    ref.listen<int>(selectedIndexProvider, (previous, next) {
      if (previous != next) {
        _pageController.jumpToPage(next);
      }
    });
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        items: bottomNavItems,
        currentIndex: selectedIndex,
        activeColor: Color(0xffFC9900),
        inactiveColor: Color(0xff606266),
        onTap: (index) => _onTabChanged(index),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        // onPageChanged: (index) => _onTabChanged(index),
        children: pages,
      ),
    );
  }

  void _onTabChanged(int index) {
    // 更新Provider中的索引
    ref.read(selectedIndexProvider.notifier).state = index;
  }
}
