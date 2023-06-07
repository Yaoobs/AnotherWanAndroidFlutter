import 'package:anotherwanandroidflutter/pages/navi/widgets/navi_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/navi_bloc.dart';

class NaviPage extends StatefulWidget {
  final NaviBloc naviBloc = NaviBloc();

  @override
  _NaviPageState createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => widget.naviBloc,
      child: BlocBuilder<NaviBloc, NaviState>(
        builder: (BuildContext context, NaviState state) {
          return ListView.builder(
            itemCount: state.naviDatas.length,
            itemBuilder: (BuildContext context, int index) {
              return NaviCell(
                index: index,
                naviDatas: state.naviDatas,
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _loadData() async {
    widget.naviBloc.add(GetNaviData());

    await Future.delayed(Duration(seconds: 2));
  }
}
