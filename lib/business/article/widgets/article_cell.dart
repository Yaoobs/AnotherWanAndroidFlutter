import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/common/app_colors.dart';
import 'package:flutter/material.dart';

class ArticleCell extends StatelessWidget {
  const ArticleCell({Key key, @required this.article}) : super(key: key);

  final ArticleData article;

  @override
  Widget build(BuildContext context) {
    // bool isCollect = widget.isFromCollect || article.collect;
    bool isCollect = false;

    String authorTitle;
    String author;

    if (article.author == null || article.author.isEmpty) {
      authorTitle = "分享人: ";
      author = article.shareUser;
    } else {
      authorTitle = "作者: ";
      author = article.author;
    }

    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Text("$authorTitle$author",
                style:
                    TextStyle(color: AppColors.colorTextAuthor, fontSize: 13))),
        Text(
          article.niceDate,
          style: TextStyle(color: AppColors.colorTextAuthor, fontSize: 13),
        )
      ],
    );

    Row title = Row(
      children: <Widget>[
        Expanded(
          child: Text.rich(
            // widget.isSearch
            //     ? StringUtils.getTextSpan(article.title, widget.id)
            // : TextSpan(text: article.title),
            TextSpan(text: article.title),
            softWrap: true,
            style: TextStyle(fontSize: 16.0, color: AppColors.colorTextTitle),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );

    Row chapterName = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 2),
          decoration: BoxDecoration(
              color: AppColors.colorCBCBD4,
              borderRadius: BorderRadius.circular(2)),
          child: Text(
            // widget.isSearch ? '' : article.chapterName,
            article.chapterName,
            softWrap: true,
            style: TextStyle(color: AppColors.colorTextAuthor, fontSize: 12),
            textAlign: TextAlign.left,
          ),
        ),
        GestureDetector(
          child: Icon(
            isCollect ? Icons.favorite : Icons.favorite_border,
            color: isCollect ? Colors.red : null,
          ),
          onTap: () {
            // if (widget.onClickCollect != null) {
            //   widget.onClickCollect.call();
            //   return;
            // }
            // _handleOnItemCollect(article);
          },
        )
      ],
    );

    Column column = Column(
      children: <Widget>[
        title,
        SizedBox(height: 5),
        row,
        SizedBox(height: 5),
        chapterName,
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.all(4),
      child: column,
    );
  }
}
