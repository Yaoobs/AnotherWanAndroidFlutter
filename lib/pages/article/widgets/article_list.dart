import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:flutter/material.dart';

import 'article_cell.dart';

class ArticleList extends StatelessWidget {
  const ArticleList(
      {Key? key, required this.articles, this.searchKey, this.onClickCollect})
      : super(key: key);

  final List<ArticleData> articles;
  final String? searchKey;
  final Function? onClickCollect;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ArticleCell(
                article: articles[index],
                searchKey: searchKey,
                onClickCollect: onClickCollect);
          },
          childCount: articles.length,
        ),
        itemExtent: 134,
      ),
    );
  }
}
