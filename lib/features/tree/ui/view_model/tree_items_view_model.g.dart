// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_items_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$treeItemsViewModelHash() =>
    r'da39035f249475f5508e92d7aae9d9ab47e4ef46';

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

abstract class _$TreeItemsViewModel
    extends BuildlessAutoDisposeAsyncNotifier<TreeItemsState> {
  late final int cid;

  FutureOr<TreeItemsState> build(int cid);
}

/// See also [TreeItemsViewModel].
@ProviderFor(TreeItemsViewModel)
const treeItemsViewModelProvider = TreeItemsViewModelFamily();

/// See also [TreeItemsViewModel].
class TreeItemsViewModelFamily extends Family<AsyncValue<TreeItemsState>> {
  /// See also [TreeItemsViewModel].
  const TreeItemsViewModelFamily();

  /// See also [TreeItemsViewModel].
  TreeItemsViewModelProvider call(int cid) {
    return TreeItemsViewModelProvider(cid);
  }

  @override
  TreeItemsViewModelProvider getProviderOverride(
    covariant TreeItemsViewModelProvider provider,
  ) {
    return call(provider.cid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'treeItemsViewModelProvider';
}

/// See also [TreeItemsViewModel].
class TreeItemsViewModelProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          TreeItemsViewModel,
          TreeItemsState
        > {
  /// See also [TreeItemsViewModel].
  TreeItemsViewModelProvider(int cid)
    : this._internal(
        () => TreeItemsViewModel()..cid = cid,
        from: treeItemsViewModelProvider,
        name: r'treeItemsViewModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$treeItemsViewModelHash,
        dependencies: TreeItemsViewModelFamily._dependencies,
        allTransitiveDependencies:
            TreeItemsViewModelFamily._allTransitiveDependencies,
        cid: cid,
      );

  TreeItemsViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cid,
  }) : super.internal();

  final int cid;

  @override
  FutureOr<TreeItemsState> runNotifierBuild(
    covariant TreeItemsViewModel notifier,
  ) {
    return notifier.build(cid);
  }

  @override
  Override overrideWith(TreeItemsViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TreeItemsViewModelProvider._internal(
        () => create()..cid = cid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cid: cid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TreeItemsViewModel, TreeItemsState>
  createElement() {
    return _TreeItemsViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TreeItemsViewModelProvider && other.cid == cid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TreeItemsViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<TreeItemsState> {
  /// The parameter `cid` of this provider.
  int get cid;
}

class _TreeItemsViewModelProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          TreeItemsViewModel,
          TreeItemsState
        >
    with TreeItemsViewModelRef {
  _TreeItemsViewModelProviderElement(super.provider);

  @override
  int get cid => (origin as TreeItemsViewModelProvider).cid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
