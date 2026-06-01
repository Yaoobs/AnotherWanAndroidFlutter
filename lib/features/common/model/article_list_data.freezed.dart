// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_list_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleListData {

 List<ArticleData>? get datas; int? get pageCount; int? get curPage;
/// Create a copy of ArticleListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleListDataCopyWith<ArticleListData> get copyWith => _$ArticleListDataCopyWithImpl<ArticleListData>(this as ArticleListData, _$identity);

  /// Serializes this ArticleListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleListData&&const DeepCollectionEquality().equals(other.datas, datas)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.curPage, curPage) || other.curPage == curPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(datas),pageCount,curPage);

@override
String toString() {
  return 'ArticleListData(datas: $datas, pageCount: $pageCount, curPage: $curPage)';
}


}

/// @nodoc
abstract mixin class $ArticleListDataCopyWith<$Res>  {
  factory $ArticleListDataCopyWith(ArticleListData value, $Res Function(ArticleListData) _then) = _$ArticleListDataCopyWithImpl;
@useResult
$Res call({
 List<ArticleData>? datas, int? pageCount, int? curPage
});




}
/// @nodoc
class _$ArticleListDataCopyWithImpl<$Res>
    implements $ArticleListDataCopyWith<$Res> {
  _$ArticleListDataCopyWithImpl(this._self, this._then);

  final ArticleListData _self;
  final $Res Function(ArticleListData) _then;

/// Create a copy of ArticleListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? datas = freezed,Object? pageCount = freezed,Object? curPage = freezed,}) {
  return _then(_self.copyWith(
datas: freezed == datas ? _self.datas : datas // ignore: cast_nullable_to_non_nullable
as List<ArticleData>?,pageCount: freezed == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int?,curPage: freezed == curPage ? _self.curPage : curPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleListData].
extension ArticleListDataPatterns on ArticleListData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleListData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleListData value)  $default,){
final _that = this;
switch (_that) {
case _ArticleListData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleListData value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleListData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ArticleData>? datas,  int? pageCount,  int? curPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleListData() when $default != null:
return $default(_that.datas,_that.pageCount,_that.curPage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ArticleData>? datas,  int? pageCount,  int? curPage)  $default,) {final _that = this;
switch (_that) {
case _ArticleListData():
return $default(_that.datas,_that.pageCount,_that.curPage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ArticleData>? datas,  int? pageCount,  int? curPage)?  $default,) {final _that = this;
switch (_that) {
case _ArticleListData() when $default != null:
return $default(_that.datas,_that.pageCount,_that.curPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleListData implements ArticleListData {
  const _ArticleListData({final  List<ArticleData>? datas, this.pageCount, this.curPage}): _datas = datas;
  factory _ArticleListData.fromJson(Map<String, dynamic> json) => _$ArticleListDataFromJson(json);

 final  List<ArticleData>? _datas;
@override List<ArticleData>? get datas {
  final value = _datas;
  if (value == null) return null;
  if (_datas is EqualUnmodifiableListView) return _datas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? pageCount;
@override final  int? curPage;

/// Create a copy of ArticleListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleListDataCopyWith<_ArticleListData> get copyWith => __$ArticleListDataCopyWithImpl<_ArticleListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleListData&&const DeepCollectionEquality().equals(other._datas, _datas)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.curPage, curPage) || other.curPage == curPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_datas),pageCount,curPage);

@override
String toString() {
  return 'ArticleListData(datas: $datas, pageCount: $pageCount, curPage: $curPage)';
}


}

/// @nodoc
abstract mixin class _$ArticleListDataCopyWith<$Res> implements $ArticleListDataCopyWith<$Res> {
  factory _$ArticleListDataCopyWith(_ArticleListData value, $Res Function(_ArticleListData) _then) = __$ArticleListDataCopyWithImpl;
@override @useResult
$Res call({
 List<ArticleData>? datas, int? pageCount, int? curPage
});




}
/// @nodoc
class __$ArticleListDataCopyWithImpl<$Res>
    implements _$ArticleListDataCopyWith<$Res> {
  __$ArticleListDataCopyWithImpl(this._self, this._then);

  final _ArticleListData _self;
  final $Res Function(_ArticleListData) _then;

/// Create a copy of ArticleListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? datas = freezed,Object? pageCount = freezed,Object? curPage = freezed,}) {
  return _then(_ArticleListData(
datas: freezed == datas ? _self._datas : datas // ignore: cast_nullable_to_non_nullable
as List<ArticleData>?,pageCount: freezed == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int?,curPage: freezed == curPage ? _self.curPage : curPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
