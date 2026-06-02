// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navi_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NaviState {

 List get naviDatas; String? get errorMessage;
/// Create a copy of NaviState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NaviStateCopyWith<NaviState> get copyWith => _$NaviStateCopyWithImpl<NaviState>(this as NaviState, _$identity);

  /// Serializes this NaviState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NaviState&&const DeepCollectionEquality().equals(other.naviDatas, naviDatas)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(naviDatas),errorMessage);

@override
String toString() {
  return 'NaviState(naviDatas: $naviDatas, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NaviStateCopyWith<$Res>  {
  factory $NaviStateCopyWith(NaviState value, $Res Function(NaviState) _then) = _$NaviStateCopyWithImpl;
@useResult
$Res call({
 List naviDatas, String? errorMessage
});




}
/// @nodoc
class _$NaviStateCopyWithImpl<$Res>
    implements $NaviStateCopyWith<$Res> {
  _$NaviStateCopyWithImpl(this._self, this._then);

  final NaviState _self;
  final $Res Function(NaviState) _then;

/// Create a copy of NaviState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? naviDatas = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
naviDatas: null == naviDatas ? _self.naviDatas : naviDatas // ignore: cast_nullable_to_non_nullable
as List,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NaviState].
extension NaviStatePatterns on NaviState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NaviState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NaviState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NaviState value)  $default,){
final _that = this;
switch (_that) {
case _NaviState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NaviState value)?  $default,){
final _that = this;
switch (_that) {
case _NaviState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List naviDatas,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NaviState() when $default != null:
return $default(_that.naviDatas,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List naviDatas,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NaviState():
return $default(_that.naviDatas,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List naviDatas,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NaviState() when $default != null:
return $default(_that.naviDatas,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NaviState implements NaviState {
  const _NaviState({final  List naviDatas = const [], this.errorMessage}): _naviDatas = naviDatas;
  factory _NaviState.fromJson(Map<String, dynamic> json) => _$NaviStateFromJson(json);

 final  List _naviDatas;
@override@JsonKey() List get naviDatas {
  if (_naviDatas is EqualUnmodifiableListView) return _naviDatas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_naviDatas);
}

@override final  String? errorMessage;

/// Create a copy of NaviState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NaviStateCopyWith<_NaviState> get copyWith => __$NaviStateCopyWithImpl<_NaviState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NaviStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NaviState&&const DeepCollectionEquality().equals(other._naviDatas, _naviDatas)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_naviDatas),errorMessage);

@override
String toString() {
  return 'NaviState(naviDatas: $naviDatas, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NaviStateCopyWith<$Res> implements $NaviStateCopyWith<$Res> {
  factory _$NaviStateCopyWith(_NaviState value, $Res Function(_NaviState) _then) = __$NaviStateCopyWithImpl;
@override @useResult
$Res call({
 List naviDatas, String? errorMessage
});




}
/// @nodoc
class __$NaviStateCopyWithImpl<$Res>
    implements _$NaviStateCopyWith<$Res> {
  __$NaviStateCopyWithImpl(this._self, this._then);

  final _NaviState _self;
  final $Res Function(_NaviState) _then;

/// Create a copy of NaviState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? naviDatas = null,Object? errorMessage = freezed,}) {
  return _then(_NaviState(
naviDatas: null == naviDatas ? _self._naviDatas : naviDatas // ignore: cast_nullable_to_non_nullable
as List,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
