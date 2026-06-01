// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TreeItemsState {

 List<ArticleData> get articles; bool get noMore; int get page; String? get errorMessage;
/// Create a copy of TreeItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeItemsStateCopyWith<TreeItemsState> get copyWith => _$TreeItemsStateCopyWithImpl<TreeItemsState>(this as TreeItemsState, _$identity);

  /// Serializes this TreeItemsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeItemsState&&const DeepCollectionEquality().equals(other.articles, articles)&&(identical(other.noMore, noMore) || other.noMore == noMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(articles),noMore,page,errorMessage);

@override
String toString() {
  return 'TreeItemsState(articles: $articles, noMore: $noMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TreeItemsStateCopyWith<$Res>  {
  factory $TreeItemsStateCopyWith(TreeItemsState value, $Res Function(TreeItemsState) _then) = _$TreeItemsStateCopyWithImpl;
@useResult
$Res call({
 List<ArticleData> articles, bool noMore, int page, String? errorMessage
});




}
/// @nodoc
class _$TreeItemsStateCopyWithImpl<$Res>
    implements $TreeItemsStateCopyWith<$Res> {
  _$TreeItemsStateCopyWithImpl(this._self, this._then);

  final TreeItemsState _self;
  final $Res Function(TreeItemsState) _then;

/// Create a copy of TreeItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? articles = null,Object? noMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
articles: null == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleData>,noMore: null == noMore ? _self.noMore : noMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeItemsState].
extension TreeItemsStatePatterns on TreeItemsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeItemsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeItemsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeItemsState value)  $default,){
final _that = this;
switch (_that) {
case _TreeItemsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeItemsState value)?  $default,){
final _that = this;
switch (_that) {
case _TreeItemsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ArticleData> articles,  bool noMore,  int page,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeItemsState() when $default != null:
return $default(_that.articles,_that.noMore,_that.page,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ArticleData> articles,  bool noMore,  int page,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _TreeItemsState():
return $default(_that.articles,_that.noMore,_that.page,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ArticleData> articles,  bool noMore,  int page,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _TreeItemsState() when $default != null:
return $default(_that.articles,_that.noMore,_that.page,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TreeItemsState implements TreeItemsState {
  const _TreeItemsState({final  List<ArticleData> articles = const [], this.noMore = false, this.page = 0, this.errorMessage}): _articles = articles;
  factory _TreeItemsState.fromJson(Map<String, dynamic> json) => _$TreeItemsStateFromJson(json);

 final  List<ArticleData> _articles;
@override@JsonKey() List<ArticleData> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}

@override@JsonKey() final  bool noMore;
@override@JsonKey() final  int page;
@override final  String? errorMessage;

/// Create a copy of TreeItemsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeItemsStateCopyWith<_TreeItemsState> get copyWith => __$TreeItemsStateCopyWithImpl<_TreeItemsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TreeItemsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeItemsState&&const DeepCollectionEquality().equals(other._articles, _articles)&&(identical(other.noMore, noMore) || other.noMore == noMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_articles),noMore,page,errorMessage);

@override
String toString() {
  return 'TreeItemsState(articles: $articles, noMore: $noMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TreeItemsStateCopyWith<$Res> implements $TreeItemsStateCopyWith<$Res> {
  factory _$TreeItemsStateCopyWith(_TreeItemsState value, $Res Function(_TreeItemsState) _then) = __$TreeItemsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ArticleData> articles, bool noMore, int page, String? errorMessage
});




}
/// @nodoc
class __$TreeItemsStateCopyWithImpl<$Res>
    implements _$TreeItemsStateCopyWith<$Res> {
  __$TreeItemsStateCopyWithImpl(this._self, this._then);

  final _TreeItemsState _self;
  final $Res Function(_TreeItemsState) _then;

/// Create a copy of TreeItemsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? articles = null,Object? noMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_TreeItemsState(
articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleData>,noMore: null == noMore ? _self.noMore : noMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
