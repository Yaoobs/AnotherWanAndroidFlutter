import 'package:anotherwanandroidflutter/common/colors.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

// EasyRefresh 配置
class EasyRefreshConfig {
  // 私有命名构造函数，以下实现 EasyRefreshConfig 单例
  EasyRefreshConfig._privateConstructor();
  factory EasyRefreshConfig() => _instance;
  static final EasyRefreshConfig _instance =
      EasyRefreshConfig._privateConstructor();

  Footer get footer => ClassicFooter(
    infiniteOffset: null,
    dragText: "上拉加载更多",
    armedText: "松开立即刷新",
    processingText: "数据加载中...",
    readyText: "数据加载中...",
    processedText: "加载完成",
    failedText: "加载失败",
    noMoreText: "没有更多数据了",
    messageText: "上次更新 %T",
    iconTheme: IconThemeData(color: AppColors.colorFFFFFFFF),
    textStyle: TextStyle(color: AppColors.colorTextAuthor),
    messageStyle: TextStyle(color: AppColors.colorTextAuthor),
  );
  Header get header => const MaterialHeader();
  // BezierCircleHeader(
  //   foregroundColor: AppColors.colorPrimary,
  //   backgroundColor: Colors.transparent,
  // );
}
