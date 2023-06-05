part of 'navi_bloc.dart';

abstract class NaviEvent extends Equatable {
  const NaviEvent();

  @override
  List<Object> get props => [];
}

class NaviEventLoadData extends NaviEvent {
  const NaviEventLoadData();
}
