import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/pages/article/view/article_detail_page.dart';
import 'package:flutter/material.dart';

class NaviCell extends StatelessWidget {
  const NaviCell({Key? key, required this.index, required this.naviDatas})
      : super(key: key);
  final List<dynamic> naviDatas;
  final int index;
  @override
  Widget build(BuildContext context) {
    List<Widget> naviNodes = [];
    List<ArticleData> navis = List<dynamic>.from(naviDatas[index]['articles'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList();
    for (ArticleData navi in navis) {
      Widget actionChip = HotKeyCell(
        text: navi.title ?? "",
        onPressed: () {
          Navigator.of(context).push(ArticleDetailPage.route(article: navi));
        },
      );

      naviNodes.add(actionChip);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(naviDatas[index]['name'],
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16.0))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Wrap(
              spacing: 15.0,
              runSpacing: 0,
              children: naviNodes,
            )),
      ],
    );
  }
}

class HotKeyCell extends StatelessWidget {
  final String? text;

  final VoidCallback onPressed;

  const HotKeyCell({Key? key, this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
        backgroundColor: Theme.of(context).primaryColor,
        label: Text(
          text ?? "",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: onPressed);
  }
}
