import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/search/ui/widgets/hotkeylist_cell.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NaviCell extends StatelessWidget {
  const NaviCell({super.key, required this.index, required this.naviDatas});
  final List<dynamic> naviDatas;
  final int index;
  @override
  Widget build(BuildContext context) {
    List<Widget> naviNodes = [];
    List<ArticleData> navis = List<dynamic>.from(
      naviDatas[index]['articles'],
    ).map((dynamic e) => ArticleData.fromJson(e)).toList();
    for (ArticleData navi in navis) {
      Widget actionChip = HotKeyCell(
        text: navi.title ?? "",
        onPressed: () {
          context.push(Routes.articleDetail, extra: {'article': navi});
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
          child: Text(
            naviDatas[index]['name'],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Wrap(spacing: 15.0, runSpacing: 0, children: naviNodes),
        ),
      ],
    );
  }
}
