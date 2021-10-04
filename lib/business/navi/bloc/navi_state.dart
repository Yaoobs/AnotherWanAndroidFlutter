part of 'navi_bloc.dart';

class NaviState extends Equatable {
  final List<dynamic> naviDatas;
  const NaviState({
    this.naviDatas = const [],
  }) : super();

  NaviState copyWith({
    List<dynamic> naviDatas,
  }) {
    return NaviState(
      naviDatas: naviDatas ?? this.naviDatas,
    );
  }

  @override
  List<Object> get props => [naviDatas];
}
