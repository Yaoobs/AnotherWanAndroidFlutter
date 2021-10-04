import 'package:anotherwanandroidflutter/business/search/models/hotkey_data.dart';
import 'package:anotherwanandroidflutter/business/tree/widgets/treelist_cell.dart';
import 'package:flutter/material.dart';

class HotKeyListCell extends StatelessWidget {
  const HotKeyListCell({Key key, @required this.hotKeys}) : super(key: key);
  final List<HotKeyData> hotKeys;
  @override
  Widget build(BuildContext context) {
    List<Widget> keyNodes = [];
    for (HotKeyData node in hotKeys) {
      Widget actionChip = HotKeyCell(
        text: node.name,
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return ArticleDetailPage(
          //       title: friendModel.name, url: friendModel.link);
          // }));
        },
      );

      keyNodes.add(actionChip);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text('热门搜索',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16.0))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Wrap(
              spacing: 15.0,
              runSpacing: 0,
              children: keyNodes,
            )),
      ],
    );
  }
}
