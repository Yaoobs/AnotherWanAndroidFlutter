import 'package:anotherwanandroidflutter/common/easy_refresh/easy_refresh_config.dart';
import 'package:anotherwanandroidflutter/features/common/ui/widgets/placeholders.dart';
import 'package:anotherwanandroidflutter/features/project/ui/view_model/project_list_view_model.dart';
import 'package:anotherwanandroidflutter/features/project/ui/widgets/project_list.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ProjectListPage extends ConsumerStatefulWidget {
  const ProjectListPage({super.key, required this.params});
  final Map params;

  @override
  ConsumerState createState() => ProjectListPageState();
}

class ProjectListPageState extends ConsumerState<ProjectListPage>
    with AutomaticKeepAliveClientMixin {
  late EasyRefreshController _controller;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final projectListState = ref.watch(
      projectListViewModelProvider(widget.params['cid']),
    );
    return projectListState.when(
      data: (state) {
        List<Widget> slivers = [];
        if (widget.params['cid'] != 0) {
          slivers.add(ProjectList(articles: state.articles));
        }
        return EasyRefresh(
          controller: _controller,
          header: EasyRefreshConfig().header,
          footer: EasyRefreshConfig().footer,
          child: CustomScrollView(slivers: slivers),
          onRefresh: () async {
            ref
                .read(
                  projectListViewModelProvider(widget.params['cid']).notifier,
                )
                .getProjectList();
            _controller.finishRefresh();
          },
          onLoad: () async {
            ref
                .read(
                  projectListViewModelProvider(widget.params['cid']).notifier,
                )
                .getProjectList(loadMore: true);
            _controller.finishLoad(
              (projectListState.value?.noMore ?? false)
                  ? IndicatorResult.noMore
                  : IndicatorResult.success,
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
              BannerPlaceholder(),
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
