import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:flutter/material.dart';

import 'article_cell.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key key, @required this.articles, this.searchKey}) : super(key: key);

  final List<ArticleData> articles;
  final String searchKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ArticleCell(
              article: articles[index],
              searchKey: searchKey
            );
          },
          childCount: articles.length,
        ),
        itemExtent: 130,
      ),
    );
  }
}
