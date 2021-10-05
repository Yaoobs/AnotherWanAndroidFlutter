import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/business/article/models/article_tags_data.dart';
import 'package:anotherwanandroidflutter/common/app_colors.dart';
import 'package:anotherwanandroidflutter/common/utils_string.dart';
import 'package:flutter/material.dart';

class ArticleCell extends StatelessWidget {
  const ArticleCell({Key key, @required this.article, this.searchKey}) : super(key: key);
  final String searchKey;
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

    Container row = Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Row(children: [
              article.type == 1
                  ? Container(
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      // margin: EdgeInsets.all(4),
                      child: Text("置顶",
                          style: TextStyle(color: Colors.red, fontSize: 13)),
                    )
                  : Container(),
              Text("$authorTitle$author",
                  style:
                      TextStyle(color: AppColors.colorTextAuthor, fontSize: 13))
            ])),
            Text(
              article.niceDate,
              style: TextStyle(color: AppColors.colorTextAuthor, fontSize: 13),
            )
          ],
        ));

    Container title = Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text.rich(
                this.searchKey != null
                    ? UtilsString.getTextSpan(article.title, this.searchKey):
                TextSpan(text: article.title),
                softWrap: true,
                style:
                    TextStyle(fontSize: 16.0, color: AppColors.colorTextTitle),
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ));

    Row chapterName = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            // padding: EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 2),
            child: Row(children: [
          article.tags.length > 0
              ? Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  // margin: EdgeInsets.all(4),
                  child: Text(getTags(article),
                      style: TextStyle(color: Colors.blueAccent, fontSize: 13)),
                )
              : Container(),
          Text(
            // widget.isSearch ? '' : article.chapterName,
            "${article.superChapterName}" + "-" + "${article.chapterName}",
            softWrap: true,
            style: TextStyle(color: AppColors.colorTextAuthor, fontSize: 12),
            textAlign: TextAlign.left,
          ),
        ])),
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
        row,
        title,
        chapterName,
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.all(2),
      child: column,
    );
  }

  String getTags(ArticleData data) {
    List<ArticleTagsData> tags = List<dynamic>.from(data.tags)
        .map((dynamic e) => ArticleTagsData.fromJson(e))
        .toList();
    return tags[0].name;
  }
}
