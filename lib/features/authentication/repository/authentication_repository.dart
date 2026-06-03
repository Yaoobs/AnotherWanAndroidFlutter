import 'dart:convert';
import 'package:anotherwanandroidflutter/common/constant.dart';
import 'package:anotherwanandroidflutter/features/authentication/model/user.dart';
import 'package:anotherwanandroidflutter/utils/storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository.g.dart';

@riverpod
Future<AuthenticationRepository> authenticationRepository(Ref ref) async {
  return AuthenticationRepository();
}

/// uninitialized - 身份验证未初始化；  authenticated - 认证成功；  unauthenticated 认证失败
enum AuthenticationStatus { uninitialized, authenticated, unauthenticated }

class AuthenticationRepository {
  User? _user;

  User? getUser() {
    if (_user == null) {
      String? json =
          StorageUtil().getString(Constants.STORAGE_LOGIN_USER_KEY, encrypt: true);
      if (json != null) {
        Map map = jsonDecode(json);
        _user = User.fromJson(map as Map<String, dynamic>);
      }
    }
    return _user;
  }

  /// 缓存登录信息
  void saveAuthenticationInfo(User user) {
    String json = jsonEncode(user.toJson());
    StorageUtil().setString(Constants.STORAGE_LOGIN_USER_KEY, json, encrypt: true);
  }

  /// 清除登录信息
  void clearAuthenticationInfo() {
    StorageUtil().remove(Constants.STORAGE_LOGIN_USER_KEY);
  }
}
