import 'package:anotherwanandroidflutter/app.dart';
import 'package:anotherwanandroidflutter/global.dart';
import 'package:anotherwanandroidflutter/utils/provider_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  Global.init().then((value) {
    runApp(ProviderScope(observers: [AppObserver()], child: const App()));
  });
}
