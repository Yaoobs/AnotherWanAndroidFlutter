// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticleState _$ArticleStateFromJson(Map<String, dynamic> json) =>
    _ArticleState(
      banners:
          (json['banners'] as List<dynamic>?)
              ?.map((e) => BannerData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((e) => ArticleData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      noMore: json['noMore'] as bool? ?? false,
      page: (json['page'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ArticleStateToJson(_ArticleState instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'articles': instance.articles,
      'noMore': instance.noMore,
      'page': instance.page,
      'errorMessage': instance.errorMessage,
    };
