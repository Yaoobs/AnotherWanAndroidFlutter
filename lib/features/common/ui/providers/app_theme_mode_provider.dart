import 'package:anotherwanandroidflutter/common/constant.dart';
import 'package:anotherwanandroidflutter/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_mode_provider.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() async {
    final currentMode = StorageUtil().getString(Constants.themeModeKey);
    return ThemeMode.values.firstWhere(
      (value) => currentMode == value.name,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> updateMode(ThemeMode mode) async {
    state = AsyncData(mode);
    StorageUtil().setString(Constants.themeModeKey, mode.name);
  }
}
