import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_tags_data.dart';
import 'package:anotherwanandroidflutter/routing/routes.dart';
import 'package:anotherwanandroidflutter/utils/utils_string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectCell extends StatelessWidget {
  const ProjectCell({super.key, required this.article, this.onClickCollect});
  final ArticleData article;
  final Function? onClickCollect;

  @override
  Widget build(BuildContext context) {
    bool isCollect = article.collect == null && article.originId != null
        ? true
        : article.collect ?? false;

    String authorTitle;
    String author;

    if (article.author == null || article.author!.isEmpty) {
      authorTitle = "分享人: ";
      author = article.shareUser ?? "";
    } else {
      authorTitle = "作者: ";
      author = article.author ?? "";
    }

    Container auther = Container(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                article.type == 1
                    ? Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        // margin: EdgeInsets.all(4),
                        child: Text(
                          "置顶",
                          style: TextStyle(color: Colors.red, fontSize: 13),
                        ),
                      )
                    : Container(),
                Text(
                  "$authorTitle$author",
                  style: TextStyle(
                    color: AppColors.colorTextAuthor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Text(
            article.niceDate ?? "",
            style: TextStyle(color: AppColors.colorTextAuthor, fontSize: 13),
          ),
        ],
      ),
    );

    Container title = Container(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text.rich(
              TextSpan(text: article.title) as InlineSpan,
              softWrap: true,
              style: TextStyle(fontSize: 16.0, color: AppColors.colorTextTitle),
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    Container content = Container(
      padding: const EdgeInsets.only(top: 5),
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text.rich(
              TextSpan(text: article.desc) as InlineSpan,
              softWrap: true,
              style: TextStyle(
                fontSize: 14.0,
                color: AppColors.colorTextContent,
              ),
              textAlign: TextAlign.left,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    Row like = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(),
        GestureDetector(
          child: Icon(
            isCollect ? Icons.favorite : Icons.favorite_border,
            color: isCollect ? Colors.red : null,
          ),
          onTap: () => onClickCollect != null
              ? onClickCollect!(article.id, article.originId)
              : null,
        ),
      ],
    );

    Column column = Column(children: <Widget>[title, content, auther, like]);

    Image image = Image(
      fit: BoxFit.cover,
      height: 200,
      width: 100,
      image: NetworkImage(
        UtilsString.parseInvalidUrl(article.envelopePic ?? ""),
      ),
    );

    Row row = Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, right: 15),
          child: image,
        ),
        Expanded(child: column),
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
        child: row,
      ),
      onTap: () {
        context.push(Routes.articleDetail, extra: {'article': article});
      },
    );
  }

  String getTags(ArticleData data) {
    List<ArticleTagsData> tags = List<dynamic>.from(
      data.tags!,
    ).map((dynamic e) => ArticleTagsData.fromJson(e)).toList();
    return tags[0].name ?? "";
  }
}
