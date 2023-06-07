import 'package:anotherwanandroidflutter/pages/project/bloc/project_bloc.dart';
import 'package:anotherwanandroidflutter/pages/project/view/project_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ProjectListPage extends StatefulWidget {
  ProjectListPage({Key? key, required this.params}) : super(key: key);
  final ProjectBloc projectBloc = ProjectBloc();
  final Map params;

  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _loadData(widget.params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => widget.projectBloc,
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (BuildContext context, ProjectState state) {
          List<Widget> slivers = [];
          slivers.add(ProjectList(
            articles: state.articles,
          ));
          return EasyRefresh.custom(
            header: BallPulseHeader(),
            footer: null,
            slivers: slivers,
            onRefresh: () async {
              widget.params['page'] = 0;
              await _loadData(widget.params);
            },
            onLoad: () async {
              widget.params['page'] = (widget.params['page'] ?? 0) + 1;
              await _loadData(widget.params);
            },
          );
        },
      ),
    );
  }

  Future<void> _loadData(Map params) async {
    widget.projectBloc.add(GetListData(params: params));

    await Future.delayed(Duration(seconds: 2));
  }
}
