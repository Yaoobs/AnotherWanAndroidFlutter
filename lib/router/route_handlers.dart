import 'package:anotherwanandroidflutter/pages/home/view/home_page.dart';
import 'package:anotherwanandroidflutter/pages/login/view/login_page.dart';
import 'package:anotherwanandroidflutter/pages/search/bloc/search_bloc.dart';
import 'package:anotherwanandroidflutter/pages/search/view/search_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/collect/bloc/collect_bloc.dart';
import '../pages/collect/view/collect_list_page.dart';

Handler homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  return HomePage();
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  return LoginPage();
});

Handler searchHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  return SearchPage();
});

Handler collectHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  return CollectListPage();
});

Handler emptyHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  return Container();
});
