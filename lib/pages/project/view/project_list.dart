import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/pages/project/widgets/project_cell.dart';
import 'package:flutter/material.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({Key? key, required this.articles, this.searchKey})
      : super(key: key);

  final List<ArticleData> articles;
  final String? searchKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ProjectCell(
                article: articles[index], searchKey: searchKey ?? "");
          },
          childCount: articles.length,
        ),
        itemExtent: 200,
      ),
    );
  }
}
