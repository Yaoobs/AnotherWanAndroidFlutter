import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:anotherwanandroidflutter/business/login/login.dart';
import 'package:anotherwanandroidflutter/business/authentication/authentication_repository/authentication_repository.dart';
import 'package:anotherwanandroidflutter/business/authentication/bloc/authentication_bloc.dart';

final List _listItems = [
  {
    'icon': AndotherFonts.article_liked,
    'title': '喜欢的文章',
  },
  {
    'icon': AndotherFonts.about,
    'title': '关于我们',
  },
];

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> slivers = [];
    slivers.add(_header());
    slivers.add(
      SliverToBoxAdapter(
        child: Divider(
          height: 26,
          thickness: 0.5,
          color: Color(0x33999999),
        ),
      ),
    );
    slivers.add(_list());
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: slivers,
      )),
    );
  }

  Widget _header() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
            child: GestureDetector(
          onTap: state.status != AuthenticationStatus.authenticated
              ? () {
                  Navigator.of(context).push(LoginPage.route());
                }
              : null,
          child: Container(
            child: Row(children: [
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
                  child: Text(state.user.nickname.isNotEmpty ? state.user.nickname:'昵称',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff303133),
                      )))
            ]),
          ),
        ));
      },
    );
  }

  Widget _list() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (content, index) {
          if (index.isOdd) {
            return Divider(
              height: 1,
              thickness: 0.5,
              color: Color(0xFFEEEEEE),
            );
          } else {
            Map map = _listItems[index ~/ 2];
            return _listCell(map['icon'], map['title']);
          }
        },
        childCount: _listItems.length * 2 - 1,
      ),
    );
  }

  Widget _listCell(IconData font, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              font,
              size: 25,
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Text(title,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff303133),
                        )))),
            Icon(
              AndotherFonts.next,
              size: 20,
            ),
          ]),
    );
  }
}
