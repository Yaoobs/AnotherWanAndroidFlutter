// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wxarticle_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wxArticleListViewModelHash() =>
    r'f524ea269bac12423ece0baefc28fdc56c4fb82a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WxArticleListViewModel
    extends BuildlessAutoDisposeAsyncNotifier<WxArticleListState> {
  late final int id;

  FutureOr<WxArticleListState> build(int id);
}

/// See also [WxArticleListViewModel].
@ProviderFor(WxArticleListViewModel)
const wxArticleListViewModelProvider = WxArticleListViewModelFamily();

/// See also [WxArticleListViewModel].
class WxArticleListViewModelFamily
    extends Family<AsyncValue<WxArticleListState>> {
  /// See also [WxArticleListViewModel].
  const WxArticleListViewModelFamily();

  /// See also [WxArticleListViewModel].
  WxArticleListViewModelProvider call(int id) {
    return WxArticleListViewModelProvider(id);
  }

  @override
  WxArticleListViewModelProvider getProviderOverride(
    covariant WxArticleListViewModelProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'wxArticleListViewModelProvider';
}

/// See also [WxArticleListViewModel].
class WxArticleListViewModelProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          WxArticleListViewModel,
          WxArticleListState
        > {
  /// See also [WxArticleListViewModel].
  WxArticleListViewModelProvider(int id)
    : this._internal(
        () => WxArticleListViewModel()..id = id,
        from: wxArticleListViewModelProvider,
        name: r'wxArticleListViewModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$wxArticleListViewModelHash,
        dependencies: WxArticleListViewModelFamily._dependencies,
        allTransitiveDependencies:
            WxArticleListViewModelFamily._allTransitiveDependencies,
        id: id,
      );

  WxArticleListViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<WxArticleListState> runNotifierBuild(
    covariant WxArticleListViewModel notifier,
  ) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(WxArticleListViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: WxArticleListViewModelProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    WxArticleListViewModel,
    WxArticleListState
  >
  createElement() {
    return _WxArticleListViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WxArticleListViewModelProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WxArticleListViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<WxArticleListState> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WxArticleListViewModelProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          WxArticleListViewModel,
          WxArticleListState
        >
    with WxArticleListViewModelRef {
  _WxArticleListViewModelProviderElement(super.provider);

  @override
  int get id => (origin as WxArticleListViewModelProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
