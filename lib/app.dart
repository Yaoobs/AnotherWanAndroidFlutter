import 'package:anotherwanandroidflutter/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'extensions/build_context_extension.dart';
import 'features/common/ui/providers/app_theme_mode_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider);
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      builder: () => MaterialApp.router(
        theme: context.lightTheme,
        darkTheme: context.darkTheme,
        themeMode: themeMode.value,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        // builder: (context, child) {
        //   return OfflineContainer(child: child);
        // },
      ),
    );
  }
}
