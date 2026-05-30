import 'package:flutter/material.dart';
import '../common/colors.dart';

extension ThemeModeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeData get lightTheme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: Theme.of(this).colorScheme.copyWith(
              brightness: Brightness.light,
              primary: AppColors.colorPrimary,
              error: AppColors.error,
            ),
        textTheme: Theme.of(this).textTheme.apply(
              bodyColor: AppColors.primaryTextColor,
            ),
      );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.black,
        colorScheme: Theme.of(this).colorScheme.copyWith(
              brightness: Brightness.dark,
              primary: AppColors.colorPrimary,
              error: AppColors.error,
            ),
        textTheme: Theme.of(this).textTheme.apply(
              bodyColor: AppColors.white,
            ),
      );

  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  // void tryLaunchUrl(String url) async {
  //   try {
  //     await launchUrl(Uri.parse(url));
  //   } catch (e) {
  //     if (mounted) {
  //       showErrorSnackBar('Can not open url: $url');
  //     }
  //   }
  // }
}
