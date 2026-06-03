// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectListState {

 List<ArticleData> get articles; bool get noMore; int get page; int get cid; String? get errorMessage;
/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListStateCopyWith<ProjectListState> get copyWith => _$ProjectListStateCopyWithImpl<ProjectListState>(this as ProjectListState, _$identity);

  /// Serializes this ProjectListState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListState&&const DeepCollectionEquality().equals(other.articles, articles)&&(identical(other.noMore, noMore) || other.noMore == noMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(articles),noMore,page,cid,errorMessage);

@override
String toString() {
  return 'ProjectListState(articles: $articles, noMore: $noMore, page: $page, cid: $cid, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProjectListStateCopyWith<$Res>  {
  factory $ProjectListStateCopyWith(ProjectListState value, $Res Function(ProjectListState) _then) = _$ProjectListStateCopyWithImpl;
@useResult
$Res call({
 List<ArticleData> articles, bool noMore, int page, int cid, String? errorMessage
});




}
/// @nodoc
class _$ProjectListStateCopyWithImpl<$Res>
    implements $ProjectListStateCopyWith<$Res> {
  _$ProjectListStateCopyWithImpl(this._self, this._then);

  final ProjectListState _self;
  final $Res Function(ProjectListState) _then;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? articles = null,Object? noMore = null,Object? page = null,Object? cid = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
articles: null == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleData>,noMore: null == noMore ? _self.noMore : noMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,cid: null == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectListState].
extension ProjectListStatePatterns on ProjectListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectListState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectListState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ArticleData> articles,  bool noMore,  int page,  int cid,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectListState() when $default != null:
return $default(_that.articles,_that.noMore,_that.page,_that.cid,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ArticleData> articles,  bool noMore,  int page,  int cid,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ProjectListState():
return $default(_that.articles,_that.noMore,_that.page,_that.cid,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ArticleData> articles,  bool noMore,  int page,  int cid,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ProjectListState() when $default != null:
return $default(_that.articles,_that.noMore,_that.page,_that.cid,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectListState implements ProjectListState {
  const _ProjectListState({final  List<ArticleData> articles = const [], this.noMore = false, this.page = 1, this.cid = 0, this.errorMessage}): _articles = articles;
  factory _ProjectListState.fromJson(Map<String, dynamic> json) => _$ProjectListStateFromJson(json);

 final  List<ArticleData> _articles;
@override@JsonKey() List<ArticleData> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}

@override@JsonKey() final  bool noMore;
@override@JsonKey() final  int page;
@override@JsonKey() final  int cid;
@override final  String? errorMessage;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectListStateCopyWith<_ProjectListState> get copyWith => __$ProjectListStateCopyWithImpl<_ProjectListState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectListStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectListState&&const DeepCollectionEquality().equals(other._articles, _articles)&&(identical(other.noMore, noMore) || other.noMore == noMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_articles),noMore,page,cid,errorMessage);

@override
String toString() {
  return 'ProjectListState(articles: $articles, noMore: $noMore, page: $page, cid: $cid, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ProjectListStateCopyWith<$Res> implements $ProjectListStateCopyWith<$Res> {
  factory _$ProjectListStateCopyWith(_ProjectListState value, $Res Function(_ProjectListState) _then) = __$ProjectListStateCopyWithImpl;
@override @useResult
$Res call({
 List<ArticleData> articles, bool noMore, int page, int cid, String? errorMessage
});




}
/// @nodoc
class __$ProjectListStateCopyWithImpl<$Res>
    implements _$ProjectListStateCopyWith<$Res> {
  __$ProjectListStateCopyWithImpl(this._self, this._then);

  final _ProjectListState _self;
  final $Res Function(_ProjectListState) _then;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? articles = null,Object? noMore = null,Object? page = null,Object? cid = null,Object? errorMessage = freezed,}) {
  return _then(_ProjectListState(
articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleData>,noMore: null == noMore ? _self.noMore : noMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,cid: null == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
