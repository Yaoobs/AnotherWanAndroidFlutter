// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TreeNodeData {

 List<dynamic>? get children; int? get courseId; int? get id; String? get name; int? get order; int? get parentChapterId; bool? get userControlSetTop; int? get visible;
/// Create a copy of TreeNodeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeNodeDataCopyWith<TreeNodeData> get copyWith => _$TreeNodeDataCopyWithImpl<TreeNodeData>(this as TreeNodeData, _$identity);

  /// Serializes this TreeNodeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeNodeData&&const DeepCollectionEquality().equals(other.children, children)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.order, order) || other.order == order)&&(identical(other.parentChapterId, parentChapterId) || other.parentChapterId == parentChapterId)&&(identical(other.userControlSetTop, userControlSetTop) || other.userControlSetTop == userControlSetTop)&&(identical(other.visible, visible) || other.visible == visible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(children),courseId,id,name,order,parentChapterId,userControlSetTop,visible);

@override
String toString() {
  return 'TreeNodeData(children: $children, courseId: $courseId, id: $id, name: $name, order: $order, parentChapterId: $parentChapterId, userControlSetTop: $userControlSetTop, visible: $visible)';
}


}

/// @nodoc
abstract mixin class $TreeNodeDataCopyWith<$Res>  {
  factory $TreeNodeDataCopyWith(TreeNodeData value, $Res Function(TreeNodeData) _then) = _$TreeNodeDataCopyWithImpl;
@useResult
$Res call({
 List<dynamic>? children, int? courseId, int? id, String? name, int? order, int? parentChapterId, bool? userControlSetTop, int? visible
});




}
/// @nodoc
class _$TreeNodeDataCopyWithImpl<$Res>
    implements $TreeNodeDataCopyWith<$Res> {
  _$TreeNodeDataCopyWithImpl(this._self, this._then);

  final TreeNodeData _self;
  final $Res Function(TreeNodeData) _then;

/// Create a copy of TreeNodeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? children = freezed,Object? courseId = freezed,Object? id = freezed,Object? name = freezed,Object? order = freezed,Object? parentChapterId = freezed,Object? userControlSetTop = freezed,Object? visible = freezed,}) {
  return _then(_self.copyWith(
children: freezed == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,parentChapterId: freezed == parentChapterId ? _self.parentChapterId : parentChapterId // ignore: cast_nullable_to_non_nullable
as int?,userControlSetTop: freezed == userControlSetTop ? _self.userControlSetTop : userControlSetTop // ignore: cast_nullable_to_non_nullable
as bool?,visible: freezed == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeNodeData].
extension TreeNodeDataPatterns on TreeNodeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeNodeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeNodeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeNodeData value)  $default,){
final _that = this;
switch (_that) {
case _TreeNodeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeNodeData value)?  $default,){
final _that = this;
switch (_that) {
case _TreeNodeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<dynamic>? children,  int? courseId,  int? id,  String? name,  int? order,  int? parentChapterId,  bool? userControlSetTop,  int? visible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeNodeData() when $default != null:
return $default(_that.children,_that.courseId,_that.id,_that.name,_that.order,_that.parentChapterId,_that.userControlSetTop,_that.visible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<dynamic>? children,  int? courseId,  int? id,  String? name,  int? order,  int? parentChapterId,  bool? userControlSetTop,  int? visible)  $default,) {final _that = this;
switch (_that) {
case _TreeNodeData():
return $default(_that.children,_that.courseId,_that.id,_that.name,_that.order,_that.parentChapterId,_that.userControlSetTop,_that.visible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<dynamic>? children,  int? courseId,  int? id,  String? name,  int? order,  int? parentChapterId,  bool? userControlSetTop,  int? visible)?  $default,) {final _that = this;
switch (_that) {
case _TreeNodeData() when $default != null:
return $default(_that.children,_that.courseId,_that.id,_that.name,_that.order,_that.parentChapterId,_that.userControlSetTop,_that.visible);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TreeNodeData implements TreeNodeData {
  const _TreeNodeData({final  List<dynamic>? children, this.courseId, this.id, this.name, this.order, this.parentChapterId, this.userControlSetTop, this.visible}): _children = children;
  factory _TreeNodeData.fromJson(Map<String, dynamic> json) => _$TreeNodeDataFromJson(json);

 final  List<dynamic>? _children;
@override List<dynamic>? get children {
  final value = _children;
  if (value == null) return null;
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? courseId;
@override final  int? id;
@override final  String? name;
@override final  int? order;
@override final  int? parentChapterId;
@override final  bool? userControlSetTop;
@override final  int? visible;

/// Create a copy of TreeNodeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeNodeDataCopyWith<_TreeNodeData> get copyWith => __$TreeNodeDataCopyWithImpl<_TreeNodeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TreeNodeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeNodeData&&const DeepCollectionEquality().equals(other._children, _children)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.order, order) || other.order == order)&&(identical(other.parentChapterId, parentChapterId) || other.parentChapterId == parentChapterId)&&(identical(other.userControlSetTop, userControlSetTop) || other.userControlSetTop == userControlSetTop)&&(identical(other.visible, visible) || other.visible == visible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_children),courseId,id,name,order,parentChapterId,userControlSetTop,visible);

@override
String toString() {
  return 'TreeNodeData(children: $children, courseId: $courseId, id: $id, name: $name, order: $order, parentChapterId: $parentChapterId, userControlSetTop: $userControlSetTop, visible: $visible)';
}


}

/// @nodoc
abstract mixin class _$TreeNodeDataCopyWith<$Res> implements $TreeNodeDataCopyWith<$Res> {
  factory _$TreeNodeDataCopyWith(_TreeNodeData value, $Res Function(_TreeNodeData) _then) = __$TreeNodeDataCopyWithImpl;
@override @useResult
$Res call({
 List<dynamic>? children, int? courseId, int? id, String? name, int? order, int? parentChapterId, bool? userControlSetTop, int? visible
});




}
/// @nodoc
class __$TreeNodeDataCopyWithImpl<$Res>
    implements _$TreeNodeDataCopyWith<$Res> {
  __$TreeNodeDataCopyWithImpl(this._self, this._then);

  final _TreeNodeData _self;
  final $Res Function(_TreeNodeData) _then;

/// Create a copy of TreeNodeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? children = freezed,Object? courseId = freezed,Object? id = freezed,Object? name = freezed,Object? order = freezed,Object? parentChapterId = freezed,Object? userControlSetTop = freezed,Object? visible = freezed,}) {
  return _then(_TreeNodeData(
children: freezed == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,parentChapterId: freezed == parentChapterId ? _self.parentChapterId : parentChapterId // ignore: cast_nullable_to_non_nullable
as int?,userControlSetTop: freezed == userControlSetTop ? _self.userControlSetTop : userControlSetTop // ignore: cast_nullable_to_non_nullable
as bool?,visible: freezed == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
