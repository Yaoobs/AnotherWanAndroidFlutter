import 'package:anotherwanandroidflutter/features/authentication/repository/authentication_repository.dart';
import 'package:anotherwanandroidflutter/features/authentication/ui/view_model/authentication_view_model.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List _listItems = [];
    final authenticationState = ref.watch(authenticationViewModelProvider);
    List<Widget> slivers = [];
    slivers.add(_header(context, ref));
    slivers.add(
      SliverToBoxAdapter(
        child: Divider(height: 26, thickness: 0.5, color: Color(0x33999999)),
      ),
    );
    if (authenticationState.value?.status ==
        AuthenticationStatus.authenticated) {
      _listItems = [
        {'icon': AndotherFonts.article_liked, 'title': '喜欢的文章'},
        {'icon': AndotherFonts.about, 'title': '关于我们'},
      ];
    } else {
      _listItems = [
        {'icon': AndotherFonts.about, 'title': '关于我们'},
      ];
    }
    slivers.add(_list(context, _listItems));
    if (authenticationState.value?.status ==
        AuthenticationStatus.authenticated) {
      slivers.add(_logoutBtn(context, ref));
    }
    return SafeArea(
      child: Scaffold(body: CustomScrollView(slivers: slivers)),
    );
  }

  Widget _header(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.read(authenticationViewModelProvider);
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap:
            authenticationState.value?.status !=
                AuthenticationStatus.authenticated
            ? () {
                context.push(Routes.login);
              }
            : null,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: ClipOval(
                child: Container(
                  color: Color(0x33999999),
                  // child: state.user.logo != null
                  //     ? Image.network('https:' + state.user.logo,
                  //         width: 60, height: 60)
                  child: Container(width: 60, height: 60),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                authenticationState.value?.user?.nickname ?? '昵称',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff303133),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _list(BuildContext context, List listItem) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((content, index) {
        if (index.isOdd) {
          return Divider(height: 1, thickness: 0.5, color: Color(0xFFEEEEEE));
        } else {
          Map map = listItem[index ~/ 2];
          return _listCell(context, map['icon'], map['title']);
        }
      }, childCount: listItem.length * 2 - 1),
    );
  }

  Widget _listCell(BuildContext context, IconData font, String title) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(font, size: 25),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 15, color: Color(0xff303133)),
                ),
              ),
            ),
            Icon(AndotherFonts.next, size: 20),
          ],
        ),
      ),
      onTap: () {
        if (font == AndotherFonts.article_liked) {
          context.push(Routes.collectList);
        }
      },
    );
  }

  Widget _logoutBtn(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: OutlinedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("提示"),
                  content: const Text("您确定退出登录吗"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // 关闭对话框
                      },
                      child: Text(
                        "取消",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref
                            .watch(authenticationViewModelProvider.notifier)
                            .onLogout();
                        Navigator.of(context).pop(); // 先关闭对话框
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue, // AppColors.primaryColor
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("确定"),
                    ),
                  ],
                );
              },
            );
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.grey, // AppColors.gray
            minimumSize: const Size(double.infinity, 48), // block: true, 宽度充满
            side: const BorderSide(color: Colors.grey), // plain: true 效果
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100), // 圆角
            ),
          ),
          child: const Text("退出登录"),
        ),
        // NButton(
        //   text: "退出登录",
        //   textColor: AppColors.gray,
        //   block: true,
        //   plain: true,
        //   borderRadius: BorderRadius.circular(100.w),
        //   onClick: () {
        //     showDialog(
        //       context: context,
        //       builder: (_) {
        //         return NDialog(
        //           title: "提示",
        //           message: "您确定退出登录吗",
        //           showCancelButton: true,
        //           confirmTextColor: AppColors.white,
        //           confirmButtonColor: AppColors.primaryColor,
        //           onConfirm: () {
        //             // context.read<AuthenticationBloc>().add(LogoutEvent());
        //           },
        //         );
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
