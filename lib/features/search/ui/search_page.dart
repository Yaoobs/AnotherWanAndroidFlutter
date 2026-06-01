import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/common/easy_refresh/easy_refresh_config.dart';
import 'package:anotherwanandroidflutter/features/article/ui/widget/article_list.dart';
import 'package:anotherwanandroidflutter/features/search/ui/view_model/search_view_model.dart';
import 'package:anotherwanandroidflutter/features/search/ui/widgets/hotkeylist_cell.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState createState() => SearchPageState();
}

class SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  late EasyRefreshController _controller;
  final FocusNode _contentFocusNode = FocusNode();

  @override
  void initState() {
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextField searchField = TextField(
      autofocus: true,
      focusNode: _contentFocusNode,
      textInputAction: TextInputAction.search,
      onSubmitted: (string) {
        _contentFocusNode.unfocus();
        _changeContent();
      },
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '搜索关键词',
        hintStyle: TextStyle(color: Colors.white),
      ),
      controller: _searchController,
    );
    final searchState = ref.watch(searchViewModelProvider);
    List<Widget> slivers = [];
    slivers.add(
      ArticleList(
        articles: searchState.value?.searchResults ?? [],
        searchKey: _searchController.text,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorPrimary,
        title: searchField,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _contentFocusNode.unfocus();
              _changeContent();
            },
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _searchController.clear();
              ref.read(searchViewModelProvider.notifier).clearSearchResults();
            },
          ),
        ],
      ),
      body: (_searchController.text.isEmpty)
          ? ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return HotKeyListCell(
                  hotKeys: searchState.value?.hotKeys ?? [],
                  onPressed: (key) {
                    _contentFocusNode.unfocus();
                    _searchController.text = key;
                    _searchController.selection = TextSelection.fromPosition(
                      TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: _searchController.text.length,
                      ),
                    );
                    _changeContent();
                  },
                );
              },
            )
          : EasyRefresh(
              controller: _controller,
              header: EasyRefreshConfig().header,
              footer: EasyRefreshConfig().footer,
              child: CustomScrollView(slivers: slivers),
              onRefresh: () {
                _changeContent();
                _controller.finishRefresh();
              },
              onLoad: () {
                _changeContent(loadMore: true);
                _controller.finishLoad(
                  (searchState.value?.noMore ?? false)
                      ? IndicatorResult.noMore
                      : IndicatorResult.success,
                );
              },
            ),
    );
  }

  void _changeContent({bool loadMore = false}) async {
    ref
        .read(searchViewModelProvider.notifier)
        .getSearchResults(key: _searchController.text, loadMore: loadMore);
  }
}
