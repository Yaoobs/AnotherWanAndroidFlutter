// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleState {

 List<BannerData> get banners; List<ArticleData> get articles; bool get noMore; int get page; String? get errorMessage;
/// Create a copy of ArticleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleStateCopyWith<ArticleState> get copyWith => _$ArticleStateCopyWithImpl<ArticleState>(this as ArticleState, _$identity);

  /// Serializes this ArticleState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleState&&const DeepCollectionEquality().equals(other.banners, banners)&&const DeepCollectionEquality().equals(other.articles, articles)&&(identical(other.noMore, noMore) || other.noMore == noMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(banners),const DeepCollectionEquality().hash(articles),noMore,page,errorMessage);

@override
String toString() {
  return 'ArticleState(banners: $banners, articles: $articles, noMore: $noMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ArticleStateCopyWith<$Res>  {
  factory $ArticleStateCopyWith(ArticleState value, $Res Function(ArticleState) _then) = _$ArticleStateCopyWithImpl;
@useResult
$Res call({
 List<BannerData> banners, List<ArticleData> articles, bool noMore, int page, String? errorMessage
});




}
/// @nodoc
class _$ArticleStateCopyWithImpl<$Res>
    implements $ArticleStateCopyWith<$Res> {
  _$ArticleStateCopyWithImpl(this._self, this._then);

  final ArticleState _self;
  final $Res Function(ArticleState) _then;

/// Create a copy of ArticleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? banners = null,Object? articles = null,Object? noMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerData>,articles: null == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleData>,noMore: null == noMore ? _self.noMore : noMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleState].
extension ArticleStatePatterns on ArticleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleState value)  $default,){
final _that = this;
switch (_that) {
case _ArticleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleState value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BannerData> banners,  List<ArticleData> articles,  bool noMore,  int page,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleState() when $default != null:
return $default(_that.banners,_that.articles,_that.noMore,_that.page,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BannerData> banners,  List<ArticleData> articles,  bool noMore,  int page,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ArticleState():
return $default(_that.banners,_that.articles,_that.noMore,_that.page,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BannerData> banners,  List<ArticleData> articles,  bool noMore,  int page,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ArticleState() when $default != null:
return $default(_that.banners,_that.articles,_that.noMore,_that.page,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleState implements ArticleState {
  const _ArticleState({final  List<BannerData> banners = const [], final  List<ArticleData> articles = const [], this.noMore = false, this.page = 0, this.errorMessage}): _banners = banners,_articles = articles;
  factory _ArticleState.fromJson(Map<String, dynamic> json) => _$ArticleStateFromJson(json);

 final  List<BannerData> _banners;
@override@JsonKey() List<BannerData> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

 final  List<ArticleData> _articles;
@override@JsonKey() List<ArticleData> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}

@override@JsonKey() final  bool noMore;
@override@JsonKey() final  int page;
@override final  String? errorMessage;

/// Create a copy of ArticleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleStateCopyWith<_ArticleState> get copyWith => __$ArticleStateCopyWithImpl<_ArticleState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleState&&const DeepCollectionEquality().equals(other._banners, _banners)&&const DeepCollectionEquality().equals(other._articles, _articles)&&(identical(other.noMore, noMore) || other.noMore == noMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_articles),noMore,page,errorMessage);

@override
String toString() {
  return 'ArticleState(banners: $banners, articles: $articles, noMore: $noMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ArticleStateCopyWith<$Res> implements $ArticleStateCopyWith<$Res> {
  factory _$ArticleStateCopyWith(_ArticleState value, $Res Function(_ArticleState) _then) = __$ArticleStateCopyWithImpl;
@override @useResult
$Res call({
 List<BannerData> banners, List<ArticleData> articles, bool noMore, int page, String? errorMessage
});




}
/// @nodoc
class __$ArticleStateCopyWithImpl<$Res>
    implements _$ArticleStateCopyWith<$Res> {
  __$ArticleStateCopyWithImpl(this._self, this._then);

  final _ArticleState _self;
  final $Res Function(_ArticleState) _then;

/// Create a copy of ArticleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? banners = null,Object? articles = null,Object? noMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_ArticleState(
banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerData>,articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleData>,noMore: null == noMore ? _self.noMore : noMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
