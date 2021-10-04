part of 'treeitems_bloc.dart';

abstract class TreeItemsEvent extends Equatable {
  const TreeItemsEvent();

  @override
  List<Object> get props => [];
}

class TreeItemsEventSelectedIndexChanged extends TreeItemsEvent {
  const TreeItemsEventSelectedIndexChanged(this.selectedIndex);
  final int selectedIndex;
}

class TreeItemsEventLoadData extends TreeItemsEvent {
  const TreeItemsEventLoadData({this.params});
  final Map params;
}