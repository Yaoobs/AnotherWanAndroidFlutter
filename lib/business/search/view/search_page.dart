import 'package:anotherwanandroidflutter/business/search/bloc/search_bloc.dart';
import 'package:anotherwanandroidflutter/business/search/widgets/hotkeylist_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key, @required this.searchBloc}) : super(key: key);
  final SearchBloc searchBloc;
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => SearchPage(searchBloc: SearchBloc()));
  }

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextField searchField = TextField(
      autofocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: (string) {
        // changeContent();
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
                  // changeContent();
                }),
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  // setState(() {
                  //   _searchController.clear();
                  // });
                }),
          ],
        ),
        body: BlocProvider(
          create: (context) => widget.searchBloc,
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (BuildContext context, SearchState state) {
              return 
              ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return HotKeyListCell(
                    hotKeys: state.hotKeys,
                  );
                },
              );
            },
          ),
        ));
  }

  Future<void> _loadData() async {
    widget.searchBloc.add(SearchEventLoadData());

    await Future.delayed(Duration(seconds: 2));
  }
}
