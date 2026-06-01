// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TreeListState _$TreeListStateFromJson(Map<String, dynamic> json) =>
    _TreeListState(
      treeList:
          (json['treeList'] as List<dynamic>?)
              ?.map((e) => TreeNodeData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$TreeListStateToJson(_TreeListState instance) =>
    <String, dynamic>{
      'treeList': instance.treeList,
      'errorMessage': instance.errorMessage,
    };
