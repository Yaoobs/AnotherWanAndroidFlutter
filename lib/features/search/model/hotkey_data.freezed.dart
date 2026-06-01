// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotkey_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotKeyData {

 int? get id; String? get link; String? get name; int? get order; int? get visible;
/// Create a copy of HotKeyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotKeyDataCopyWith<HotKeyData> get copyWith => _$HotKeyDataCopyWithImpl<HotKeyData>(this as HotKeyData, _$identity);

  /// Serializes this HotKeyData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotKeyData&&(identical(other.id, id) || other.id == id)&&(identical(other.link, link) || other.link == link)&&(identical(other.name, name) || other.name == name)&&(identical(other.order, order) || other.order == order)&&(identical(other.visible, visible) || other.visible == visible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,link,name,order,visible);

@override
String toString() {
  return 'HotKeyData(id: $id, link: $link, name: $name, order: $order, visible: $visible)';
}


}

/// @nodoc
abstract mixin class $HotKeyDataCopyWith<$Res>  {
  factory $HotKeyDataCopyWith(HotKeyData value, $Res Function(HotKeyData) _then) = _$HotKeyDataCopyWithImpl;
@useResult
$Res call({
 int? id, String? link, String? name, int? order, int? visible
});




}
/// @nodoc
class _$HotKeyDataCopyWithImpl<$Res>
    implements $HotKeyDataCopyWith<$Res> {
  _$HotKeyDataCopyWithImpl(this._self, this._then);

  final HotKeyData _self;
  final $Res Function(HotKeyData) _then;

/// Create a copy of HotKeyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? link = freezed,Object? name = freezed,Object? order = freezed,Object? visible = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,visible: freezed == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HotKeyData].
extension HotKeyDataPatterns on HotKeyData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotKeyData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotKeyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotKeyData value)  $default,){
final _that = this;
switch (_that) {
case _HotKeyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotKeyData value)?  $default,){
final _that = this;
switch (_that) {
case _HotKeyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? link,  String? name,  int? order,  int? visible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotKeyData() when $default != null:
return $default(_that.id,_that.link,_that.name,_that.order,_that.visible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? link,  String? name,  int? order,  int? visible)  $default,) {final _that = this;
switch (_that) {
case _HotKeyData():
return $default(_that.id,_that.link,_that.name,_that.order,_that.visible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? link,  String? name,  int? order,  int? visible)?  $default,) {final _that = this;
switch (_that) {
case _HotKeyData() when $default != null:
return $default(_that.id,_that.link,_that.name,_that.order,_that.visible);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotKeyData implements HotKeyData {
  const _HotKeyData({this.id, this.link, this.name, this.order, this.visible});
  factory _HotKeyData.fromJson(Map<String, dynamic> json) => _$HotKeyDataFromJson(json);

@override final  int? id;
@override final  String? link;
@override final  String? name;
@override final  int? order;
@override final  int? visible;

/// Create a copy of HotKeyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotKeyDataCopyWith<_HotKeyData> get copyWith => __$HotKeyDataCopyWithImpl<_HotKeyData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotKeyDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotKeyData&&(identical(other.id, id) || other.id == id)&&(identical(other.link, link) || other.link == link)&&(identical(other.name, name) || other.name == name)&&(identical(other.order, order) || other.order == order)&&(identical(other.visible, visible) || other.visible == visible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,link,name,order,visible);

@override
String toString() {
  return 'HotKeyData(id: $id, link: $link, name: $name, order: $order, visible: $visible)';
}


}

/// @nodoc
abstract mixin class _$HotKeyDataCopyWith<$Res> implements $HotKeyDataCopyWith<$Res> {
  factory _$HotKeyDataCopyWith(_HotKeyData value, $Res Function(_HotKeyData) _then) = __$HotKeyDataCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? link, String? name, int? order, int? visible
});




}
/// @nodoc
class __$HotKeyDataCopyWithImpl<$Res>
    implements _$HotKeyDataCopyWith<$Res> {
  __$HotKeyDataCopyWithImpl(this._self, this._then);

  final _HotKeyData _self;
  final $Res Function(_HotKeyData) _then;

/// Create a copy of HotKeyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? link = freezed,Object? name = freezed,Object? order = freezed,Object? visible = freezed,}) {
  return _then(_HotKeyData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,visible: freezed == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
