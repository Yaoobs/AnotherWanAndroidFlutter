import 'dart:io';

import 'package:anotherwanandroidflutter/http/http_manager.dart';
import 'package:anotherwanandroidflutter/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/// 全局配置
class Global {

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 本地数据存储工具初始
    await StorageUtil().init();

    // // 读取设备第一次打开
    // isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    // if (isFirstOpen) {
    //   StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    // }

    // 初始化网络请求
    HttpManager.init();

    // Android 沉浸式状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle style = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,

          ///这是设置状态栏的图标和字体的颜色
          ///Brightness.light  一般都是显示为白色
          ///Brightness.dark 一般都是显示为黑色
          statusBarIconBrightness: Brightness.light);
      SystemChrome.setSystemUIOverlayStyle(style);
    }
  }
}
