// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navi_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NaviState _$NaviStateFromJson(Map<String, dynamic> json) => _NaviState(
  naviDatas: json['naviDatas'] as List<dynamic>? ?? const [],
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$NaviStateToJson(_NaviState instance) =>
    <String, dynamic>{
      'naviDatas': instance.naviDatas,
      'errorMessage': instance.errorMessage,
    };
