import 'package:anotherwanandroidflutter/pages/article/widgets/article_list.dart';
import 'package:anotherwanandroidflutter/pages/search/bloc/search_bloc.dart';
import 'package:anotherwanandroidflutter/pages/search/widgets/hotkeylist_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.searchBloc, required this.params})
      : super(key: key);
  final SearchBloc searchBloc;
  final Map params;
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) =>
            SearchPage(searchBloc: SearchBloc(), params: {'page': 0}));
  }

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _contentFocusNode = FocusNode();
  @override
  void initState() {
    _loadHotKeys();
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
        widget.params['page'] = 0;
        _changeContent(widget.params);
      },
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '搜索关键词',
          hintStyle: TextStyle(color: Colors.white)),
      controller: _searchController,
    );

    return Scaffold(
        appBar: AppBar(
          title: searchField,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _contentFocusNode.unfocus();
                  widget.params['page'] = 0;
                  _changeContent(widget.params);
                }),
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _searchController.clear();
                  widget.params['page'] = 0;
                  _changeContent(widget.params);
                }),
          ],
        ),
        body: BlocProvider(
          create: (context) => widget.searchBloc,
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (BuildContext context, SearchState state) {
              List<Widget> slivers = [];
              slivers.add(ArticleList(
                articles: state.articles,
                searchKey: _searchController.text,
              ));
              return (_searchController.text == null ||
                      _searchController.text.isEmpty)
                  ? ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return HotKeyListCell(
                          hotKeys: state.hotKeys,
                          onPressed: (key) {
                            _contentFocusNode.unfocus();
                            _searchController.text = key;
                            _searchController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    affinity: TextAffinity.downstream,
                                    offset: _searchController.text.length));
                            widget.params['page'] = 0;
                            _changeContent(widget.params);
                          },
                        );
                      },
                    )
                  : EasyRefresh.custom(
                      header: BallPulseHeader(),
                      footer: null,
                      slivers: slivers,
                      onRefresh: () async {
                        widget.params['page'] = 0;
                        await _changeContent(widget.params);
                      },
                      onLoad: () async {
                        widget.params['page'] =
                            (widget.params['page'] ?? 0) + 1;
                        await _changeContent(widget.params);
                      },
                    );
            },
          ),
        ));
  }

  Future<void> _loadHotKeys() async {
    widget.searchBloc.add(SearchEventLoadHotKeys());

    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> _changeContent(Map params) async {
    params['key'] = _searchController.text;

    widget.searchBloc.add(SearchEventSearchAction(params: params));

    await Future.delayed(Duration(seconds: 2));
  }
}
