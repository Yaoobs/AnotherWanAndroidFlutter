// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wxarticle_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WxArticleListState _$WxArticleListStateFromJson(Map<String, dynamic> json) =>
    _WxArticleListState(
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((e) => ArticleData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      noMore: json['noMore'] as bool? ?? false,
      page: (json['page'] as num?)?.toInt() ?? 1,
      id: (json['id'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$WxArticleListStateToJson(_WxArticleListState instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'noMore': instance.noMore,
      'page': instance.page,
      'id': instance.id,
      'errorMessage': instance.errorMessage,
    };
