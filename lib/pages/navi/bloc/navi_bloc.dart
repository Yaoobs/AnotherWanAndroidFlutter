import 'package:anotherwanandroidflutter/api/navi/navi_api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navi_event.dart';
part 'navi_state.dart';

class NaviBloc extends Bloc<NaviEvent, NaviState> {
  NaviBloc() : super(NaviState()) {
    on<GetNaviData>((event, emit) => _getNaviList(event, emit));
  }

  _getNaviList(
    NaviEvent event,
    Emitter<NaviState> emit,
  ) async {
    // 获取 导航列表
    List naviDatas = await NaviApi.naviList();

    emit(state.copyWith(
      naviDatas: naviDatas,
    ));
  }
}
