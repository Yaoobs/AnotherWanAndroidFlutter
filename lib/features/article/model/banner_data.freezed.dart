// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerData {

 String? get desc; int? get id; String? get imagePath; int? get isVisible; int? get order; String? get title; int? get type; String? get url;
/// Create a copy of BannerData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerDataCopyWith<BannerData> get copyWith => _$BannerDataCopyWithImpl<BannerData>(this as BannerData, _$identity);

  /// Serializes this BannerData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerData&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.id, id) || other.id == id)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,desc,id,imagePath,isVisible,order,title,type,url);

@override
String toString() {
  return 'BannerData(desc: $desc, id: $id, imagePath: $imagePath, isVisible: $isVisible, order: $order, title: $title, type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class $BannerDataCopyWith<$Res>  {
  factory $BannerDataCopyWith(BannerData value, $Res Function(BannerData) _then) = _$BannerDataCopyWithImpl;
@useResult
$Res call({
 String? desc, int? id, String? imagePath, int? isVisible, int? order, String? title, int? type, String? url
});




}
/// @nodoc
class _$BannerDataCopyWithImpl<$Res>
    implements $BannerDataCopyWith<$Res> {
  _$BannerDataCopyWithImpl(this._self, this._then);

  final BannerData _self;
  final $Res Function(BannerData) _then;

/// Create a copy of BannerData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? desc = freezed,Object? id = freezed,Object? imagePath = freezed,Object? isVisible = freezed,Object? order = freezed,Object? title = freezed,Object? type = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,isVisible: freezed == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerData].
extension BannerDataPatterns on BannerData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerData value)  $default,){
final _that = this;
switch (_that) {
case _BannerData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerData value)?  $default,){
final _that = this;
switch (_that) {
case _BannerData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? desc,  int? id,  String? imagePath,  int? isVisible,  int? order,  String? title,  int? type,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerData() when $default != null:
return $default(_that.desc,_that.id,_that.imagePath,_that.isVisible,_that.order,_that.title,_that.type,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? desc,  int? id,  String? imagePath,  int? isVisible,  int? order,  String? title,  int? type,  String? url)  $default,) {final _that = this;
switch (_that) {
case _BannerData():
return $default(_that.desc,_that.id,_that.imagePath,_that.isVisible,_that.order,_that.title,_that.type,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? desc,  int? id,  String? imagePath,  int? isVisible,  int? order,  String? title,  int? type,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _BannerData() when $default != null:
return $default(_that.desc,_that.id,_that.imagePath,_that.isVisible,_that.order,_that.title,_that.type,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerData implements BannerData {
  const _BannerData({this.desc, this.id, this.imagePath, this.isVisible, this.order, this.title, this.type, this.url});
  factory _BannerData.fromJson(Map<String, dynamic> json) => _$BannerDataFromJson(json);

@override final  String? desc;
@override final  int? id;
@override final  String? imagePath;
@override final  int? isVisible;
@override final  int? order;
@override final  String? title;
@override final  int? type;
@override final  String? url;

/// Create a copy of BannerData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerDataCopyWith<_BannerData> get copyWith => __$BannerDataCopyWithImpl<_BannerData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerData&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.id, id) || other.id == id)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,desc,id,imagePath,isVisible,order,title,type,url);

@override
String toString() {
  return 'BannerData(desc: $desc, id: $id, imagePath: $imagePath, isVisible: $isVisible, order: $order, title: $title, type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class _$BannerDataCopyWith<$Res> implements $BannerDataCopyWith<$Res> {
  factory _$BannerDataCopyWith(_BannerData value, $Res Function(_BannerData) _then) = __$BannerDataCopyWithImpl;
@override @useResult
$Res call({
 String? desc, int? id, String? imagePath, int? isVisible, int? order, String? title, int? type, String? url
});




}
/// @nodoc
class __$BannerDataCopyWithImpl<$Res>
    implements _$BannerDataCopyWith<$Res> {
  __$BannerDataCopyWithImpl(this._self, this._then);

  final _BannerData _self;
  final $Res Function(_BannerData) _then;

/// Create a copy of BannerData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? desc = freezed,Object? id = freezed,Object? imagePath = freezed,Object? isVisible = freezed,Object? order = freezed,Object? title = freezed,Object? type = freezed,Object? url = freezed,}) {
  return _then(_BannerData(
desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,isVisible: freezed == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
