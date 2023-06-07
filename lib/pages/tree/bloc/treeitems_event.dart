part of 'treeitems_bloc.dart';

abstract class TreeItemsEvent extends Equatable {
  const TreeItemsEvent();

  @override
  List<Object> get props => [];
}

class SelectedIndexChanged extends TreeItemsEvent {
  const SelectedIndexChanged(this.selectedIndex);
  final int selectedIndex;
}

class GetItemData extends TreeItemsEvent {
  const GetItemData({required this.params});
  final Map params;
}
