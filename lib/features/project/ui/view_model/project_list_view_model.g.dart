// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectListViewModelHash() =>
    r'e8ce0b086ecea19b5cc0759f15b2c63a2059ba76';

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

abstract class _$ProjectListViewModel
    extends BuildlessAutoDisposeAsyncNotifier<ProjectListState> {
  late final int cid;

  FutureOr<ProjectListState> build(int cid);
}

/// See also [ProjectListViewModel].
@ProviderFor(ProjectListViewModel)
const projectListViewModelProvider = ProjectListViewModelFamily();

/// See also [ProjectListViewModel].
class ProjectListViewModelFamily extends Family<AsyncValue<ProjectListState>> {
  /// See also [ProjectListViewModel].
  const ProjectListViewModelFamily();

  /// See also [ProjectListViewModel].
  ProjectListViewModelProvider call(int cid) {
    return ProjectListViewModelProvider(cid);
  }

  @override
  ProjectListViewModelProvider getProviderOverride(
    covariant ProjectListViewModelProvider provider,
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
  String? get name => r'projectListViewModelProvider';
}

/// See also [ProjectListViewModel].
class ProjectListViewModelProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProjectListViewModel,
          ProjectListState
        > {
  /// See also [ProjectListViewModel].
  ProjectListViewModelProvider(int cid)
    : this._internal(
        () => ProjectListViewModel()..cid = cid,
        from: projectListViewModelProvider,
        name: r'projectListViewModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$projectListViewModelHash,
        dependencies: ProjectListViewModelFamily._dependencies,
        allTransitiveDependencies:
            ProjectListViewModelFamily._allTransitiveDependencies,
        cid: cid,
      );

  ProjectListViewModelProvider._internal(
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
  FutureOr<ProjectListState> runNotifierBuild(
    covariant ProjectListViewModel notifier,
  ) {
    return notifier.build(cid);
  }

  @override
  Override overrideWith(ProjectListViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectListViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<
    ProjectListViewModel,
    ProjectListState
  >
  createElement() {
    return _ProjectListViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectListViewModelProvider && other.cid == cid;
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
mixin ProjectListViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<ProjectListState> {
  /// The parameter `cid` of this provider.
  int get cid;
}

class _ProjectListViewModelProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProjectListViewModel,
          ProjectListState
        >
    with ProjectListViewModelRef {
  _ProjectListViewModelProviderElement(super.provider);

  @override
  int get cid => (origin as ProjectListViewModelProvider).cid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
