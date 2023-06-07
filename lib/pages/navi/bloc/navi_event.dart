part of 'navi_bloc.dart';

abstract class NaviEvent extends Equatable {
  const NaviEvent();

  @override
  List<Object> get props => [];
}

class GetNaviData extends NaviEvent {
  const GetNaviData();
}
