// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_tags_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ArticleTagsData _$ArticleTagsDataFromJson(
  Map<String, dynamic> json
) {
    return _ArticleListData.fromJson(
      json
    );
}

/// @nodoc
mixin _$ArticleTagsData {

 String? get name; String? get url;
/// Create a copy of ArticleTagsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleTagsDataCopyWith<ArticleTagsData> get copyWith => _$ArticleTagsDataCopyWithImpl<ArticleTagsData>(this as ArticleTagsData, _$identity);

  /// Serializes this ArticleTagsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleTagsData&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'ArticleTagsData(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $ArticleTagsDataCopyWith<$Res>  {
  factory $ArticleTagsDataCopyWith(ArticleTagsData value, $Res Function(ArticleTagsData) _then) = _$ArticleTagsDataCopyWithImpl;
@useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class _$ArticleTagsDataCopyWithImpl<$Res>
    implements $ArticleTagsDataCopyWith<$Res> {
  _$ArticleTagsDataCopyWithImpl(this._self, this._then);

  final ArticleTagsData _self;
  final $Res Function(ArticleTagsData) _then;

/// Create a copy of ArticleTagsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleTagsData].
extension ArticleTagsDataPatterns on ArticleTagsData {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleListData() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? url)  $default,) {final _that = this;
switch (_that) {
case _ArticleListData():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _ArticleListData() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleListData implements ArticleTagsData {
  const _ArticleListData({this.name, this.url});
  factory _ArticleListData.fromJson(Map<String, dynamic> json) => _$ArticleListDataFromJson(json);

@override final  String? name;
@override final  String? url;

/// Create a copy of ArticleTagsData
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleListData&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'ArticleTagsData(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ArticleListDataCopyWith<$Res> implements $ArticleTagsDataCopyWith<$Res> {
  factory _$ArticleListDataCopyWith(_ArticleListData value, $Res Function(_ArticleListData) _then) = __$ArticleListDataCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class __$ArticleListDataCopyWithImpl<$Res>
    implements _$ArticleListDataCopyWith<$Res> {
  __$ArticleListDataCopyWithImpl(this._self, this._then);

  final _ArticleListData _self;
  final $Res Function(_ArticleListData) _then;

/// Create a copy of ArticleTagsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_ArticleListData(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
