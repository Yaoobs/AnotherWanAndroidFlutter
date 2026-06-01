// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotkey_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotKeyData _$HotKeyDataFromJson(Map<String, dynamic> json) => _HotKeyData(
  id: (json['id'] as num?)?.toInt(),
  link: json['link'] as String?,
  name: json['name'] as String?,
  order: (json['order'] as num?)?.toInt(),
  visible: (json['visible'] as num?)?.toInt(),
);

Map<String, dynamic> _$HotKeyDataToJson(_HotKeyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
