part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class SelectedIndexChanged extends ProjectEvent {
  const SelectedIndexChanged(this.selectedIndex);
  final int selectedIndex;
}

class GetTreeData extends ProjectEvent {
  const GetTreeData();
}

class GetListData extends ProjectEvent {
  const GetListData({required this.params});
  final Map params;
}
