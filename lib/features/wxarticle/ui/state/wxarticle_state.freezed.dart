// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wxarticle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WxArticleState {

 List<TreeNodeData> get articleChapters; String? get errorMessage;
/// Create a copy of WxArticleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WxArticleStateCopyWith<WxArticleState> get copyWith => _$WxArticleStateCopyWithImpl<WxArticleState>(this as WxArticleState, _$identity);

  /// Serializes this WxArticleState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WxArticleState&&const DeepCollectionEquality().equals(other.articleChapters, articleChapters)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(articleChapters),errorMessage);

@override
String toString() {
  return 'WxArticleState(articleChapters: $articleChapters, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $WxArticleStateCopyWith<$Res>  {
  factory $WxArticleStateCopyWith(WxArticleState value, $Res Function(WxArticleState) _then) = _$WxArticleStateCopyWithImpl;
@useResult
$Res call({
 List<TreeNodeData> articleChapters, String? errorMessage
});




}
/// @nodoc
class _$WxArticleStateCopyWithImpl<$Res>
    implements $WxArticleStateCopyWith<$Res> {
  _$WxArticleStateCopyWithImpl(this._self, this._then);

  final WxArticleState _self;
  final $Res Function(WxArticleState) _then;

/// Create a copy of WxArticleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? articleChapters = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
articleChapters: null == articleChapters ? _self.articleChapters : articleChapters // ignore: cast_nullable_to_non_nullable
as List<TreeNodeData>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WxArticleState].
extension WxArticleStatePatterns on WxArticleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WxArticleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WxArticleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WxArticleState value)  $default,){
final _that = this;
switch (_that) {
case _WxArticleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WxArticleState value)?  $default,){
final _that = this;
switch (_that) {
case _WxArticleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TreeNodeData> articleChapters,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WxArticleState() when $default != null:
return $default(_that.articleChapters,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TreeNodeData> articleChapters,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _WxArticleState():
return $default(_that.articleChapters,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TreeNodeData> articleChapters,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _WxArticleState() when $default != null:
return $default(_that.articleChapters,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WxArticleState implements WxArticleState {
  const _WxArticleState({final  List<TreeNodeData> articleChapters = const [], this.errorMessage}): _articleChapters = articleChapters;
  factory _WxArticleState.fromJson(Map<String, dynamic> json) => _$WxArticleStateFromJson(json);

 final  List<TreeNodeData> _articleChapters;
@override@JsonKey() List<TreeNodeData> get articleChapters {
  if (_articleChapters is EqualUnmodifiableListView) return _articleChapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articleChapters);
}

@override final  String? errorMessage;

/// Create a copy of WxArticleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WxArticleStateCopyWith<_WxArticleState> get copyWith => __$WxArticleStateCopyWithImpl<_WxArticleState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WxArticleStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WxArticleState&&const DeepCollectionEquality().equals(other._articleChapters, _articleChapters)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_articleChapters),errorMessage);

@override
String toString() {
  return 'WxArticleState(articleChapters: $articleChapters, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$WxArticleStateCopyWith<$Res> implements $WxArticleStateCopyWith<$Res> {
  factory _$WxArticleStateCopyWith(_WxArticleState value, $Res Function(_WxArticleState) _then) = __$WxArticleStateCopyWithImpl;
@override @useResult
$Res call({
 List<TreeNodeData> articleChapters, String? errorMessage
});




}
/// @nodoc
class __$WxArticleStateCopyWithImpl<$Res>
    implements _$WxArticleStateCopyWith<$Res> {
  __$WxArticleStateCopyWithImpl(this._self, this._then);

  final _WxArticleState _self;
  final $Res Function(_WxArticleState) _then;

/// Create a copy of WxArticleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? articleChapters = null,Object? errorMessage = freezed,}) {
  return _then(_WxArticleState(
articleChapters: null == articleChapters ? _self._articleChapters : articleChapters // ignore: cast_nullable_to_non_nullable
as List<TreeNodeData>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
