import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/view_model/tree_list_view_model.dart';
import 'package:anotherwanandroidflutter/features/tree/ui/widgets/treelist_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anotherwanandroidflutter/features/common/ui/widgets/placeholders.dart';
import 'package:shimmer/shimmer.dart';

class TreeListPage extends ConsumerStatefulWidget {
  const TreeListPage({super.key});

  @override
  ConsumerState createState() => _TreeListPageState();
}

class _TreeListPageState extends ConsumerState<TreeListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final treeListState = ref.watch(treeListViewModelProvider);
    return treeListState.when(
      data: (state) {
        return ListView.builder(
          itemCount: treeListState.value?.treeList.length,
          itemBuilder: (BuildContext context, int index) {
            return TreeListCell(
              index: index,
              nodeDatas: treeListState.value?.treeList ?? [],
              onPressed: (i) {
                // List<TreeNodeData> nodes = List<Map>.from(
                //   treeListState.value!.treeList[index].children!,
                // ).map((dynamic e) => TreeNodeData.fromJson(e)).toList();
                // Navigator.of(context).push(TreeItemsPage.route(nodes, i));
              },
            );
          },
        );
      },
       loading: () => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: const SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TitlePlaceholder(width: double.infinity),
                SizedBox(height: 16.0),
                ContentPlaceholder(lineType: ContentLineType.threeLines),
                SizedBox(height: 16.0),
                TitlePlaceholder(width: 200.0),
                SizedBox(height: 16.0),
                ContentPlaceholder(lineType: ContentLineType.twoLines),
                SizedBox(height: 16.0),
                TitlePlaceholder(width: 200.0),
                SizedBox(height: 16.0),
                ContentPlaceholder(lineType: ContentLineType.twoLines),
              ],
            ),
          ),
        ),
        error: (error, stack) => Center(child: Text(error.toString())),
    );
  }
}
