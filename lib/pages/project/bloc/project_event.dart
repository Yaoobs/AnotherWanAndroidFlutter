part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class ProjectEventSelectedIndexChanged extends ProjectEvent {
  const ProjectEventSelectedIndexChanged(this.selectedIndex);
  final int selectedIndex;
}

class ProjectEventLoadItems extends ProjectEvent {
  const ProjectEventLoadItems();
}

class ProjectEventLoadData extends ProjectEvent {
  const ProjectEventLoadData({required this.params});
  final Map params;
}
