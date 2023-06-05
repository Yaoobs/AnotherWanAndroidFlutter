import 'package:anotherwanandroidflutter/pages/article/bloc/article_bloc.dart';
import 'package:anotherwanandroidflutter/pages/article/view/article_page.dart';
import 'package:anotherwanandroidflutter/pages/home/cubit/tab_cubit.dart';
import 'package:anotherwanandroidflutter/pages/profile/view/profile_page.dart';
import 'package:anotherwanandroidflutter/pages/project/bloc/project_bloc.dart';
import 'package:anotherwanandroidflutter/pages/project/view/project_page.dart';
import 'package:anotherwanandroidflutter/pages/tree/bloc/tree_bloc.dart';
import 'package:anotherwanandroidflutter/pages/tree/view/tree_page.dart';
import 'package:anotherwanandroidflutter/pages/wxarticle/bloc/wxarticle_bloc.dart';
import 'package:anotherwanandroidflutter/pages/wxarticle/view/wxarticle_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anotherwanandroidflutter/common/icons.dart';

List<String> appBarTitles = ['首页', '体系', '公众号', '项目', '我的'];

final List<BottomNavigationBarItem> bottomNavItems = [
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

final pages = [
  ArticlePage(
    articleBloc: ArticleBloc(),
    params: {'page': 0},
  ),
  TreePage(
    treeBloc: TreeBloc(),
  ),
  WxArticlePage(wxArticleBloc: WxArticleBloc()),
  ProjectPage(projectBloc: ProjectBloc()),
  ProfilePage(),
];

PageController _pageController = PageController();

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabCubit(),
      child: Scaffold(
        bottomNavigationBar:
            BlocBuilder<TabCubit, int>(builder: (context, state) {
          return CupertinoTabBar(
            items: bottomNavItems,
            currentIndex: state,
            activeColor: Color(0xffFC9900),
            inactiveColor: Color(0xff606266),
            onTap: (index) => _onTabChanged(context, index),
          );
        }),
        body: PageView(
          children: pages,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  void _onTabChanged(BuildContext context, int index) {
    context.read<TabCubit>().update(index);
    _pageController.jumpToPage(index);
  }
}
