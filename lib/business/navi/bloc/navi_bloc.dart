import 'dart:async';

import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/network/navi/net_navi.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navi_event.dart';
part 'navi_state.dart';

class NaviBloc extends Bloc<NaviEvent, NaviState> {
  NaviBloc() : super(NaviState());

  @override
  Stream<NaviState> mapEventToState(
    NaviEvent event,
  ) async* {
    if (event is NaviEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  Stream<NaviState> _mapLoadDataToState(
    NaviEvent event,
    NaviState state,
  ) async* {
    // 获取 导航列表
    List naviDatas = await AWANaviNetManager.naviList();

    yield state.copyWith(
      naviDatas: naviDatas,
    );
  }
}
