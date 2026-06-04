import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/common/easy_refresh/easy_refresh_config.dart';
import 'package:anotherwanandroidflutter/features/article/ui/state/article_state.dart';
import 'package:anotherwanandroidflutter/features/article/ui/view_model/article_view_model.dart';
import 'package:anotherwanandroidflutter/features/article/ui/widget/article_list.dart';
import 'package:anotherwanandroidflutter/features/article/ui/widget/image_banner.dart';
import 'package:anotherwanandroidflutter/features/article/ui/widget/sep_divider.dart';
import 'package:anotherwanandroidflutter/features/authentication/repository/authentication_repository.dart';
import 'package:anotherwanandroidflutter/features/authentication/ui/view_model/authentication_view_model.dart';
import 'package:anotherwanandroidflutter/features/common/ui/widgets/placeholders.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ArticleScreen extends ConsumerStatefulWidget {
  const ArticleScreen({super.key});
  @override
  ConsumerState<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends ConsumerState<ArticleScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late EasyRefreshController _controller;
  late ScrollController _scrollController;

  @override
  void initState() {
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final articleListState = ref.watch(articleViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorPrimary,
        title: Text('首页', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              context.push(Routes.search);
            },
          ),
        ],
      ),
      body: articleListState.when(
        data: (state) {
          List<Widget> slivers = [];
          if (articleListState.value != null) {
            slivers.addAll(_sliversFromState(articleListState.value!));
          }
          return EasyRefresh(
            controller: _controller,
            header: EasyRefreshConfig().header,
            footer: EasyRefreshConfig().footer,
            child: CustomScrollView(slivers: slivers),
            onRefresh: () async {
              ref.invalidate(articleViewModelProvider);
              // ref.read(articleViewModelProvider.notifier).refreshArticles();
              _controller.finishRefresh();
            },
            onLoad: () async {
              ref.read(articleViewModelProvider.notifier).loadMoreArticles();
              _controller.finishLoad(
                (articleListState.value?.noMore ?? false)
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
      ),
    );
  }

  List<Widget> _sliversFromState(ArticleState state) {
    List<Widget> slivers = [];

    // 添加 banner
    slivers.add(SliverToBoxAdapter(child: ImageBanner(banners: state.banners)));

    slivers.add(
      ArticleList(
        articles: state.articles,
        onClickCollect: (id, originId) {
          final authenticationState = ref.read(authenticationViewModelProvider);
          if (authenticationState.value?.status ==
              AuthenticationStatus.authenticated) {
            ref.read(articleViewModelProvider.notifier).toggleCollect(id);
          } else {
            context.push(Routes.login);
          }
        },
      ),
    );
    slivers.add(
      SliverToBoxAdapter(
        child: state.noMore
            ? SepDivider(
                text: Text(
                  '人家也是有底线的',
                  style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                ),
              )
            : Container(),
      ),
    );
    return slivers;
  }
}
