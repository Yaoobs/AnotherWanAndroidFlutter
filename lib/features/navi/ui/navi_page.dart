import 'package:anotherwanandroidflutter/features/common/ui/widgets/placeholders.dart';
import 'package:anotherwanandroidflutter/features/navi/ui/view_model/navi_view_model.dart';
import 'package:anotherwanandroidflutter/features/navi/ui/widget/navi_cell.dart'
    show NaviCell;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class NaviPage extends ConsumerStatefulWidget {
  const NaviPage({super.key});

  @override
  ConsumerState createState() => NaviPageState();
}

class NaviPageState extends ConsumerState<NaviPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final naviState = ref.watch(naviViewModelProvider);
    return naviState.when(
      data: (state) {
        return ListView.builder(
          itemCount: state.naviDatas.length,
          itemBuilder: (BuildContext context, int index) {
            return NaviCell(index: index, naviDatas: state.naviDatas);
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
