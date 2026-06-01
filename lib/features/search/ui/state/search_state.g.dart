// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchState _$SearchStateFromJson(Map<String, dynamic> json) => _SearchState(
  hotKeys:
      (json['hotKeys'] as List<dynamic>?)
          ?.map((e) => HotKeyData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  searchResults:
      (json['searchResults'] as List<dynamic>?)
          ?.map((e) => ArticleData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  noMore: json['noMore'] as bool? ?? false,
  page: (json['page'] as num?)?.toInt() ?? 0,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$SearchStateToJson(_SearchState instance) =>
    <String, dynamic>{
      'hotKeys': instance.hotKeys,
      'searchResults': instance.searchResults,
      'noMore': instance.noMore,
      'page': instance.page,
      'errorMessage': instance.errorMessage,
    };
