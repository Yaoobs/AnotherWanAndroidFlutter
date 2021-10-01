import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:flutter/material.dart';

import 'article_cell.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key key, @required this.articles}) : super(key: key);

  final List<ArticleData> articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ArticleCell(
              article: articles[index],
            );
          },
          childCount: articles.length,
        ),
        itemExtent: 120,
      ),
    );
  }
}
