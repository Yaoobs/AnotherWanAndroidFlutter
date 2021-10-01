import 'package:anotherwanandroidflutter/business/home/view/home_page.dart';
import 'package:anotherwanandroidflutter/business/login/view/login_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return HomePage();
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoginPage();
});

Handler emptyHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return Container();
});
