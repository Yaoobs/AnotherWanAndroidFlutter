import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:anotherwanandroidflutter/business/home/cubit/tab_cubit.dart';

List<String> appBarTitles = ['首页', '发现', '我的'];

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
    icon: const Icon(AndotherFonts.my),
    activeIcon: const Icon(AndotherFonts.my_selected),
    label: appBarTitles[2],
  ),
];

final pages = [
  Container(
      child: Center(
    child: const Text('首页'),
  )),
  Container(
      child: Center(
    child: const Text('发现'),
  )),
  Container(
      child: Center(
    child: const Text('我的'),
  )),
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
        // appBar: AppBar(title: const Text('Home')),
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
