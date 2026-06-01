import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:anotherwanandroidflutter/features/article/model/banner_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({super.key, this.article, this.banner});
  final ArticleData? article;
  final BannerData? banner;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            EasyLoading.show();
          },
          onPageFinished: (url) {
            EasyLoading.dismiss();
          },
          onWebResourceError: (error) {},
        ),
      )
      ..setBackgroundColor(AppColors.backgroundColor); // 加载 URL

    WidgetsBinding.instance.addPostFrameCallback((ca) {
      _controller.loadRequest(
        Uri.parse(
          widget.article != null
              ? widget.article!.link!
              : widget.banner!.url!.replaceAll("www.", ""),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.article != null
              ? widget.article?.title ?? ""
              : widget.banner?.title ?? "",
          style: TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }

  @override
  void dispose() {
    // 重置 NavigationDelegate，阻止回调继续触发
    _controller.setNavigationDelegate(NavigationDelegate());
    super.dispose();
  }
}
