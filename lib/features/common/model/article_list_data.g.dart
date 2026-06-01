// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticleListData _$ArticleListDataFromJson(Map<String, dynamic> json) =>
    _ArticleListData(
      datas: (json['datas'] as List<dynamic>?)
          ?.map((e) => ArticleData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageCount: (json['pageCount'] as num?)?.toInt(),
      curPage: (json['curPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArticleListDataToJson(_ArticleListData instance) =>
    <String, dynamic>{
      'datas': instance.datas,
      'pageCount': instance.pageCount,
      'curPage': instance.curPage,
    };
