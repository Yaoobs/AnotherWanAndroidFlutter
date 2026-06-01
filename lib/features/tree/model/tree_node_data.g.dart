// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TreeNodeData _$TreeNodeDataFromJson(Map<String, dynamic> json) =>
    _TreeNodeData(
      children: json['children'] as List<dynamic>?,
      courseId: (json['courseId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      order: (json['order'] as num?)?.toInt(),
      parentChapterId: (json['parentChapterId'] as num?)?.toInt(),
      userControlSetTop: json['userControlSetTop'] as bool?,
      visible: (json['visible'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TreeNodeDataToJson(_TreeNodeData instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
