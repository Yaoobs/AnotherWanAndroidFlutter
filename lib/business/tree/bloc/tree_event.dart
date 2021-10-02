part of 'tree_bloc.dart';

abstract class TreeEvent extends Equatable {
  const TreeEvent();

  @override
  List<Object> get props => [];
}

class TreeEventSelectedIndexChanged extends TreeEvent {
  const TreeEventSelectedIndexChanged(this.selectedIndex);

  final int selectedIndex;
}