import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/common/easy_refresh/easy_refresh_config.dart';
import 'package:anotherwanandroidflutter/features/article/ui/widget/article_list.dart';
import 'package:anotherwanandroidflutter/features/authentication/repository/authentication_repository.dart';
import 'package:anotherwanandroidflutter/features/authentication/ui/view_model/authentication_view_model.dart';
import 'package:anotherwanandroidflutter/features/collect/ui/view_model/collect_list_view_model.dart';
import 'package:anotherwanandroidflutter/features/common/ui/widgets/placeholders.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class CollectListPage extends ConsumerStatefulWidget {
  const CollectListPage({super.key});

  @override
  ConsumerState createState() => _CollectListPageState();
}

class _CollectListPageState extends ConsumerState<CollectListPage> {
  late EasyRefreshController _controller;
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
    final collectListState = ref.watch(collectListViewModelProvider);
    return collectListState.when(
      data: (state) {
        List<Widget> slivers = [];
        slivers.add(
          ArticleList(
            articles: state.articles,
            onClickCollect: (id, originId) {
              final authenticationState = ref.read(
                authenticationViewModelProvider,
              );
              if (authenticationState.value?.status ==
                  AuthenticationStatus.authenticated) {
                ref
                    .read(collectListViewModelProvider.notifier)
                    .toggleCollect(id);
              } else {
                context.push(Routes.login);
              }
            },
          ),
        );
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.colorPrimary,
            title: Text('收藏', style: TextStyle(color: Colors.white)),
          ),
          body: EasyRefresh(
            controller: _controller,
            header: EasyRefreshConfig().header,
            footer: EasyRefreshConfig().footer,
            child: CustomScrollView(slivers: slivers),
            onRefresh: () async {
              ref.read(collectListViewModelProvider.notifier).getCollectList();
              _controller.finishRefresh();
            },
            onLoad: () async {
              ref
                  .read(collectListViewModelProvider.notifier)
                  .getCollectList(loadMore: true);
              _controller.finishLoad(
                (collectListState.value?.noMore ?? false)
                    ? IndicatorResult.noMore
                    : IndicatorResult.success,
              );
            },
          ),
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
