import 'package:anotherwanandroidflutter/api/navi/navi_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navi_repository.g.dart';

@riverpod
Future<NaviRepository> naviRepository(Ref ref) async {
  return NaviRepository();
}

class NaviRepository {
  NaviRepository();

  Future<List> getNaviList() async {
    final List naviDatas = [];
    try {
      // 获取 导航列表
      List results = await NaviApi.naviList();
      naviDatas.addAll(results);
    } catch (e) {
      throw Exception('Failed to fetch naviDatas: $e');
    }
    return naviDatas;
  }
}
