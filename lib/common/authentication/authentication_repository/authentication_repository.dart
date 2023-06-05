import 'dart:convert';
import 'package:anotherwanandroidflutter/common/constant.dart';
import 'package:anotherwanandroidflutter/global.dart';
import 'package:anotherwanandroidflutter/utils/storage.dart';
import 'package:anotherwanandroidflutter/models/User.dart';

/// uninitialized - 身份验证未初始化；  authenticated - 认证成功；  unauthenticated 认证失败
enum AuthenticationStatus { uninitialized, authenticated, unauthenticated }

class AuthenticationRepository {
  User? _user;

  User? getUser() {
    if (_user == null) {
      String? json =
          StorageUtil().getString(STORAGE_LOGIN_USER_KEY, encrypt: true);
      if (json != null) {
        Map map = jsonDecode(json);
        _user = User.fromJson(map as Map<String, dynamic>);
      }
    }
    return _user;
  }

  String? getCookie() {
    return StorageUtil().getString(STORAGE_LOGIN_COOKIE_KEY, encrypt: true);
  }

  /// 缓存登录信息（cookie 和 user）
  void saveAuthenticationInfo(User user, String cookie) {
    String json = jsonEncode(user.toJson());
    StorageUtil().setString(STORAGE_LOGIN_USER_KEY, json, encrypt: true);

    StorageUtil().setString(STORAGE_LOGIN_COOKIE_KEY, cookie, encrypt: true);

    Global.loginCookie = cookie;
  }

  /// 清除登录信息
  void clearAuthenticationInfo() {
    StorageUtil().remove(STORAGE_LOGIN_USER_KEY);
    StorageUtil().remove(STORAGE_LOGIN_COOKIE_KEY);
  }
}
