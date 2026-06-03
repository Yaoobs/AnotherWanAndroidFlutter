// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_items_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TreeItemsState _$TreeItemsStateFromJson(Map<String, dynamic> json) =>
    _TreeItemsState(
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((e) => ArticleData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      noMore: json['noMore'] as bool? ?? false,
      page: (json['page'] as num?)?.toInt() ?? 0,
      cid: (json['cid'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$TreeItemsStateToJson(_TreeItemsState instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'noMore': instance.noMore,
      'page': instance.page,
      'cid': instance.cid,
      'errorMessage': instance.errorMessage,
    };
