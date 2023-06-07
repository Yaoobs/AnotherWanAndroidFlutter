part of 'tree_bloc.dart';

abstract class TreeEvent extends Equatable {
  const TreeEvent();

  @override
  List<Object> get props => [];
}

class SelectedIndexChanged extends TreeEvent {
  const SelectedIndexChanged(this.selectedIndex);

  final int selectedIndex;
}
