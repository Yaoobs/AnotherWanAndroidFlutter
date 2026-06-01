import 'package:anotherwanandroidflutter/features/search/model/hotkey_data.dart';
import 'package:flutter/material.dart';

class HotKeyListCell extends StatelessWidget {
  const HotKeyListCell(
      {super.key, required this.hotKeys, required this.onPressed});
  final List<HotKeyData> hotKeys;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    List<Widget> keyNodes = [];
    for (HotKeyData node in hotKeys) {
      Widget actionChip =
          HotKeyCell(text: node.name, onPressed: () => onPressed(node.name));

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

class HotKeyCell extends StatelessWidget {
  final String? text;

  final VoidCallback onPressed;

  const HotKeyCell({super.key, this.text, required this.onPressed});

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