import 'package:flutter/material.dart';
import 'app.dart';
import 'common/application.dart';
import 'router/routes.dart';
import 'app.dart';
import 'business/authentication/authentication.dart';
import 'business/user/user.dart';
void main() {

  // 初始化
  initialize();

  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}

/// 初始化
void initialize() {
  // 初始化 路由
  Routes.configRoutes(Application.router);
}