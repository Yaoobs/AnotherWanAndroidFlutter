// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectListState _$ProjectListStateFromJson(Map<String, dynamic> json) =>
    _ProjectListState(
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((e) => ArticleData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      noMore: json['noMore'] as bool? ?? false,
      page: (json['page'] as num?)?.toInt() ?? 1,
      cid: (json['cid'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ProjectListStateToJson(_ProjectListState instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'noMore': instance.noMore,
      'page': instance.page,
      'cid': instance.cid,
      'errorMessage': instance.errorMessage,
    };
