// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectState _$ProjectStateFromJson(Map<String, dynamic> json) =>
    _ProjectState(
      projectTree:
          (json['projectTree'] as List<dynamic>?)
              ?.map((e) => TreeNodeData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ProjectStateToJson(_ProjectState instance) =>
    <String, dynamic>{
      'projectTree': instance.projectTree,
      'errorMessage': instance.errorMessage,
    };
