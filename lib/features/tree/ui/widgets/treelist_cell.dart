import 'package:anotherwanandroidflutter/features/search/ui/widgets/hotkeylist_cell.dart';
import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:flutter/material.dart';

class TreeListCell extends StatelessWidget {
  const TreeListCell(
      {super.key,
      required this.index,
      required this.nodeDatas,
      required this.onPressed});
  final List<TreeNodeData> nodeDatas;
  final int index;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    List<Widget> treeNodes = [];
    List<TreeNodeData> nodes = List<Map>.from(nodeDatas[index].children!)
        .map((dynamic e) => TreeNodeData.fromJson(e))
        .toList();
    for (int i = 0; i < nodes.length; i++) {
      Widget actionChip =
          HotKeyCell(text: nodes[i].name, onPressed: () => onPressed(i));

      treeNodes.add(actionChip);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(nodeDatas[index].name ?? "",
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