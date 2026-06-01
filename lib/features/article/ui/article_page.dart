import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/common/easy_refresh/easy_refresh_config.dart';
import 'package:anotherwanandroidflutter/features/article/ui/state/article_state.dart';
import 'package:anotherwanandroidflutter/features/article/ui/view_model/article_view_model.dart';
import 'package:anotherwanandroidflutter/features/article/ui/widget/article_list.dart';
import 'package:anotherwanandroidflutter/features/article/ui/widget/image_banner.dart';
import 'package:anotherwanandroidflutter/features/article/ui/widget/sep_divider.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    // 加载Banner
    // widget.articleBloc.add(GetBannerData());
    // 加载文章
    // _loadData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Future<void> _loadData() async {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final articleListState = ref.watch(articleViewModelProvider);
    List<Widget> slivers = [];
    if (articleListState.value != null) {
      slivers.addAll(_sliversFromState(articleListState.value!));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorPrimary,
        title: Text('首页', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Application.router.navigateTo(context, Routes.search);
            },
          ),
        ],
      ),
      body: EasyRefresh(
        controller: _controller,
        header: EasyRefreshConfig().header,
        footer: EasyRefreshConfig().footer,
        child: CustomScrollView(slivers: slivers),
        onRefresh: () async {
          ref.read(articleViewModelProvider.notifier).refreshArticles();
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
        onClickCollect: (id,originId) {
          debugPrint("");
          // widget.articleBloc.collect(id);
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
