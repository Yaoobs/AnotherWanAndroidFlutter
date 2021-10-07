import 'package:anotherwanandroidflutter/business/article/bloc/article_bloc.dart';
import 'package:anotherwanandroidflutter/business/article/view/article_page.dart';
import 'package:anotherwanandroidflutter/business/project/bloc/project_bloc.dart';
import 'package:anotherwanandroidflutter/business/project/view/project_page.dart';
import 'package:anotherwanandroidflutter/business/tree/bloc/tree_bloc.dart';
import 'package:anotherwanandroidflutter/business/tree/view/tree_page.dart';
import 'package:anotherwanandroidflutter/business/wxarticle/bloc/wxarticle_bloc.dart';
import 'package:anotherwanandroidflutter/business/wxarticle/view/wxarticle_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:anotherwanandroidflutter/business/home/cubit/tab_cubit.dart';
import 'package:anotherwanandroidflutter/business/profile/profile.dart';

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
        body: BlocBuilder<TabCubit, int>(builder: (context, state) {
          return pages[state];
        }),
      ),
    );
  }

  void _onTabChanged(BuildContext context, int index) {
    context.read<TabCubit>().update(index);
  }
}
