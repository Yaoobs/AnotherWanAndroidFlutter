import 'package:anotherwanandroidflutter/business/tree/models/tree_node_data.dart';
import 'package:anotherwanandroidflutter/business/tree/view/tree_items_page.dart';
import 'package:flutter/material.dart';

class TreeListCell extends StatelessWidget {
  const TreeListCell({Key key, @required this.index, @required this.nodeDatas, @required this.onPressed})
      : super(key: key);
  final List<TreeNodeData> nodeDatas;
  final int index;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    List<Widget> treeNodes = [];
    List<TreeNodeData> nodes = List<Map>.from(nodeDatas[index].children)
        .map((dynamic e) => TreeNodeData.fromJson(e))
        .toList();
    for (TreeNodeData node in nodes) {
      Widget actionChip = HotKeyCell(
        text: node.name,
        onPressed: () => onPressed(node.name)
      );

      treeNodes.add(actionChip);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(nodeDatas[index].name,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16.0))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Wrap(
              spacing: 15.0,
              runSpacing: 0,
              children: treeNodes,
            )),
      ],
    );
  }
}

class HotKeyCell extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  const HotKeyCell({Key key, this.text, this.onPressed}) : super(key: key);

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
