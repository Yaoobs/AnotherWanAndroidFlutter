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
  final List _naviDatas = [];

  Future<List> getNaviList() async {
    try {
      _naviDatas.clear();
       // 获取 导航列表
    List naviDatas = await NaviApi.naviList();
      _naviDatas.insertAll(0, naviDatas);
    } catch (e) {
      throw Exception('Failed to fetch naviDatas: $e');
    }
    return _naviDatas;
  }
}
