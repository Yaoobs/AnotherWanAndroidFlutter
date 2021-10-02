part of 'treelist_bloc.dart';

class TreeListState extends Equatable {
  final List<TreeNodeData> nodeDatas;
  const TreeListState({
    this.nodeDatas = const [],
  }) : super();

  TreeListState copyWith({
    List<TreeNodeData> nodeDatas,
  }) {
    return TreeListState(
      nodeDatas: nodeDatas ?? this.nodeDatas,
    );
  }

  @override
  List<Object> get props => [nodeDatas];
}
