import 'package:anotherwanandroidflutter/features/common/ui/base_tab_page.dart';
import 'package:anotherwanandroidflutter/features/common/ui/widgets/placeholders.dart';
import 'package:anotherwanandroidflutter/features/project/ui/project_list_page.dart';
import 'package:anotherwanandroidflutter/features/project/ui/view_model/project_view_model.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

//创建Provider来管理当前选中的索引
// 定义 family provider，接收初始索引参数
final selectedIndexProvider = StateProvider.family<int, int>((
  ref,
  initialIndex,
) {
  return initialIndex;
});

class ProjectPage extends BaseTabPage {
  const ProjectPage({super.key, super.title});

  @override
  ProjectPageState getState() => ProjectPageState();
}

class ProjectPageState extends BaseTabPageState<ProjectPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  List<Widget>? getActions() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          context.push(Routes.search);
        },
      ),
    ];
  }

  @override
  List<String> getTabTitles() {
    final wxArticleState = ref.read(projectViewModelProvider);
    return wxArticleState.value?.projectTree.map((node) {
          return node.name ?? "";
        }).toList() ??
        List.generate(28, (index) => "");
  }

  @override
  List<Widget> getTabViews() {
    final wxArticleState = ref.read(projectViewModelProvider);
    return wxArticleState.value?.projectTree.map((node) {
          return ProjectListPage(params: {'page': 0, 'cid': node.id});
        }).toList() ??
        List.generate(
          28,
          (index) => ProjectListPage(params: {'page': 0, 'cid': 0}),
        );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final projectState = ref.watch(projectViewModelProvider);
    return projectState.when(
      data: (state) {
        return buildView();
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

  @override
  StateProviderFamily<int, int> getStateProvider() {
    return selectedIndexProvider;
  }
}
