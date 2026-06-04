// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollectListState _$CollectListStateFromJson(Map<String, dynamic> json) =>
    _CollectListState(
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((e) => ArticleData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      noMore: json['noMore'] as bool? ?? false,
      page: (json['page'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$CollectListStateToJson(_CollectListState instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'noMore': instance.noMore,
      'page': instance.page,
      'errorMessage': instance.errorMessage,
    };
