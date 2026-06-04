import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/project/ui/widgets/project_cell.dart';
import 'package:flutter/material.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key, required this.articles, this.onClickCollect});

  final List<ArticleData> articles;
    final Function? onClickCollect;

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ProjectCell(
              article: articles[index],
              onClickCollect: onClickCollect);
        },
        childCount: articles.length,
      ),
      itemExtent: 200,
    );
  }
}
