import 'package:anotherwanandroidflutter/common/values/colors.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/article_tags_data.dart';
import 'package:anotherwanandroidflutter/pages/article/view/article_detail_page.dart';
import 'package:anotherwanandroidflutter/utils/utils_string.dart';
import 'package:flutter/material.dart';

class ArticleCell extends StatelessWidget {
  const ArticleCell(
      {Key? key, required this.article, this.searchKey, this.onClickCollect})
      : super(key: key);
  final String? searchKey;
  final ArticleData article;
  final Function? onClickCollect;

  @override
  Widget build(BuildContext context) {
    bool isCollect = article.collect == null && article.originId != null
        ? true
        : article.collect ?? false;

    String authorTitle;
    String? author;

    if (article.author == null || article.author!.isEmpty) {
      if (article.shareUser != null) {
        authorTitle = "分享人: ";
        author = article.shareUser;
      } else {
        authorTitle = "";
        author = "匿名";
      }
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
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      // margin: EdgeInsets.all(4),
                      child: Text("置顶",
                          style: TextStyle(color: Colors.red, fontSize: 12)),
                    )
                  : Container(),
              Text("$authorTitle$author",
                  style:
                      TextStyle(color: AppColors.colorTextAuthor, fontSize: 13))
            ])),
            Text(
              article.niceDate ?? "",
              style: TextStyle(color: AppColors.colorTextAuthor, fontSize: 13),
            )
          ],
        ));

    Container title = Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        height: 65,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            article.envelopePic != null && article.envelopePic!.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Image(
                      fit: BoxFit.cover,
                      height: 60,
                      width: 120,
                      image: NetworkImage(article.envelopePic!),
                    ))
                : Container(),
            Expanded(
              child: Text.rich(
                (this.searchKey != null
                    ? UtilsString.getTextSpan(
                        article.title ?? "", this.searchKey ?? "")
                    : TextSpan(text: article.title)) as InlineSpan,
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
          article.tags != null && article.tags!.length > 0
              ? Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  // margin: EdgeInsets.all(4),
                  child: Text(getTags(article),
                      style: TextStyle(color: Colors.blueAccent, fontSize: 12)),
                )
              : Container(),
          Text(
            // widget.isSearch ? '' : article.chapterName,
            article.superChapterName != null
                ? "${article.superChapterName}" + "-" + "${article.chapterName}"
                : "${article.chapterName}",
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
          onTap: () => this.onClickCollect != null
              ? this.onClickCollect!(article.id, article.originId)
              : null,
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

    return GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(4),
          ),
          margin: EdgeInsets.all(2),
          child: column,
        ),
        onTap: () {
          Navigator.of(context).push(ArticleDetailPage.route(article: article));
        });
  }

  String getTags(ArticleData data) {
    List<ArticleTagsData> tags = List<dynamic>.from(data.tags!)
        .map((dynamic e) => ArticleTagsData.fromJson(e))
        .toList();
    return tags[0].name ?? "";
  }
}
