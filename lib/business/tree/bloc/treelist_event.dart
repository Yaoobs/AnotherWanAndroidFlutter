part of 'treelist_bloc.dart';

abstract class TreeListEvent extends Equatable {
  const TreeListEvent();

  @override
  List<Object> get props => [];
}

class TreeListEventLoadData extends TreeListEvent {
  const TreeListEventLoadData();
}