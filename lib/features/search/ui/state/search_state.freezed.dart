// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchState {

 List<HotKeyData> get hotKeys; List<ArticleData> get searchResults; bool get noMore; int get page; String? get errorMessage;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);

  /// Serializes this SearchState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&const DeepCollectionEquality().equals(other.hotKeys, hotKeys)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.noMore, noMore) || other.noMore == noMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hotKeys),const DeepCollectionEquality().hash(searchResults),noMore,page,errorMessage);

@override
String toString() {
  return 'SearchState(hotKeys: $hotKeys, searchResults: $searchResults, noMore: $noMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 List<HotKeyData> hotKeys, List<ArticleData> searchResults, bool noMore, int page, String? errorMessage
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotKeys = null,Object? searchResults = null,Object? noMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
hotKeys: null == hotKeys ? _self.hotKeys : hotKeys // ignore: cast_nullable_to_non_nullable
as List<HotKeyData>,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<ArticleData>,noMore: null == noMore ? _self.noMore : noMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HotKeyData> hotKeys,  List<ArticleData> searchResults,  bool noMore,  int page,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.hotKeys,_that.searchResults,_that.noMore,_that.page,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HotKeyData> hotKeys,  List<ArticleData> searchResults,  bool noMore,  int page,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.hotKeys,_that.searchResults,_that.noMore,_that.page,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HotKeyData> hotKeys,  List<ArticleData> searchResults,  bool noMore,  int page,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.hotKeys,_that.searchResults,_that.noMore,_that.page,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchState implements SearchState {
  const _SearchState({final  List<HotKeyData> hotKeys = const [], final  List<ArticleData> searchResults = const [], this.noMore = false, this.page = 0, this.errorMessage}): _hotKeys = hotKeys,_searchResults = searchResults;
  factory _SearchState.fromJson(Map<String, dynamic> json) => _$SearchStateFromJson(json);

 final  List<HotKeyData> _hotKeys;
@override@JsonKey() List<HotKeyData> get hotKeys {
  if (_hotKeys is EqualUnmodifiableListView) return _hotKeys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotKeys);
}

 final  List<ArticleData> _searchResults;
@override@JsonKey() List<ArticleData> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override@JsonKey() final  bool noMore;
@override@JsonKey() final  int page;
@override final  String? errorMessage;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&const DeepCollectionEquality().equals(other._hotKeys, _hotKeys)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.noMore, noMore) || other.noMore == noMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hotKeys),const DeepCollectionEquality().hash(_searchResults),noMore,page,errorMessage);

@override
String toString() {
  return 'SearchState(hotKeys: $hotKeys, searchResults: $searchResults, noMore: $noMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<HotKeyData> hotKeys, List<ArticleData> searchResults, bool noMore, int page, String? errorMessage
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotKeys = null,Object? searchResults = null,Object? noMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_SearchState(
hotKeys: null == hotKeys ? _self._hotKeys : hotKeys // ignore: cast_nullable_to_non_nullable
as List<HotKeyData>,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<ArticleData>,noMore: null == noMore ? _self.noMore : noMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
