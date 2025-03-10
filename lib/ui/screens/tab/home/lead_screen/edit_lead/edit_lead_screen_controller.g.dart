// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_lead_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editLeadScreenControllerHash() =>
    r'a68629051e41f8fbd330484ca0a8d66e012ca8cd';

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

abstract class _$EditLeadScreenController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final int existLeadId;

  FutureOr<void> build({
    required int existLeadId,
  });
}

/// See also [EditLeadScreenController].
@ProviderFor(EditLeadScreenController)
const editLeadScreenControllerProvider = EditLeadScreenControllerFamily();

/// See also [EditLeadScreenController].
class EditLeadScreenControllerFamily extends Family<AsyncValue<void>> {
  /// See also [EditLeadScreenController].
  const EditLeadScreenControllerFamily();

  /// See also [EditLeadScreenController].
  EditLeadScreenControllerProvider call({
    required int existLeadId,
  }) {
    return EditLeadScreenControllerProvider(
      existLeadId: existLeadId,
    );
  }

  @override
  EditLeadScreenControllerProvider getProviderOverride(
    covariant EditLeadScreenControllerProvider provider,
  ) {
    return call(
      existLeadId: provider.existLeadId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'editLeadScreenControllerProvider';
}

/// See also [EditLeadScreenController].
class EditLeadScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EditLeadScreenController,
        void> {
  /// See also [EditLeadScreenController].
  EditLeadScreenControllerProvider({
    required int existLeadId,
  }) : this._internal(
          () => EditLeadScreenController()..existLeadId = existLeadId,
          from: editLeadScreenControllerProvider,
          name: r'editLeadScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editLeadScreenControllerHash,
          dependencies: EditLeadScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              EditLeadScreenControllerFamily._allTransitiveDependencies,
          existLeadId: existLeadId,
        );

  EditLeadScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.existLeadId,
  }) : super.internal();

  final int existLeadId;

  @override
  FutureOr<void> runNotifierBuild(
    covariant EditLeadScreenController notifier,
  ) {
    return notifier.build(
      existLeadId: existLeadId,
    );
  }

  @override
  Override overrideWith(EditLeadScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditLeadScreenControllerProvider._internal(
        () => create()..existLeadId = existLeadId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        existLeadId: existLeadId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<EditLeadScreenController, void>
      createElement() {
    return _EditLeadScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditLeadScreenControllerProvider &&
        other.existLeadId == existLeadId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, existLeadId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EditLeadScreenControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `existLeadId` of this provider.
  int get existLeadId;
}

class _EditLeadScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EditLeadScreenController,
        void> with EditLeadScreenControllerRef {
  _EditLeadScreenControllerProviderElement(super.provider);

  @override
  int get existLeadId =>
      (origin as EditLeadScreenControllerProvider).existLeadId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
