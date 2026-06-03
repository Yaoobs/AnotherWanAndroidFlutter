import 'package:flutter/material.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key, required this.params});
  final Map params;

  @override
  ProjectListPageState createState() => ProjectListPageState();
}

class ProjectListPageState extends State<ProjectListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }
}
