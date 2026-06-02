// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wxarticle_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WxArticleState _$WxArticleStateFromJson(Map<String, dynamic> json) =>
    _WxArticleState(
      articleChapters:
          (json['articleChapters'] as List<dynamic>?)
              ?.map((e) => TreeNodeData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$WxArticleStateToJson(_WxArticleState instance) =>
    <String, dynamic>{
      'articleChapters': instance.articleChapters,
      'errorMessage': instance.errorMessage,
    };
