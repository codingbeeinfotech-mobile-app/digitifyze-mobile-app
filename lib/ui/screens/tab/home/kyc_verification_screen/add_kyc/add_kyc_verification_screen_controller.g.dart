// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_kyc_verification_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addKycVerificationScreenControllerHash() =>
    r'd20ffe895de9a26cbb88b45654804c8f4b7bd353';

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

abstract class _$AddKycVerificationScreenController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final int existLeadId;

  FutureOr<void> build({
    required int existLeadId,
  });
}

/// See also [AddKycVerificationScreenController].
@ProviderFor(AddKycVerificationScreenController)
const addKycVerificationScreenControllerProvider =
    AddKycVerificationScreenControllerFamily();

/// See also [AddKycVerificationScreenController].
class AddKycVerificationScreenControllerFamily
    extends Family<AsyncValue<void>> {
  /// See also [AddKycVerificationScreenController].
  const AddKycVerificationScreenControllerFamily();

  /// See also [AddKycVerificationScreenController].
  AddKycVerificationScreenControllerProvider call({
    required int existLeadId,
  }) {
    return AddKycVerificationScreenControllerProvider(
      existLeadId: existLeadId,
    );
  }

  @override
  AddKycVerificationScreenControllerProvider getProviderOverride(
    covariant AddKycVerificationScreenControllerProvider provider,
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
  String? get name => r'addKycVerificationScreenControllerProvider';
}

/// See also [AddKycVerificationScreenController].
class AddKycVerificationScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        AddKycVerificationScreenController, void> {
  /// See also [AddKycVerificationScreenController].
  AddKycVerificationScreenControllerProvider({
    required int existLeadId,
  }) : this._internal(
          () => AddKycVerificationScreenController()..existLeadId = existLeadId,
          from: addKycVerificationScreenControllerProvider,
          name: r'addKycVerificationScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addKycVerificationScreenControllerHash,
          dependencies: AddKycVerificationScreenControllerFamily._dependencies,
          allTransitiveDependencies: AddKycVerificationScreenControllerFamily
              ._allTransitiveDependencies,
          existLeadId: existLeadId,
        );

  AddKycVerificationScreenControllerProvider._internal(
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
    covariant AddKycVerificationScreenController notifier,
  ) {
    return notifier.build(
      existLeadId: existLeadId,
    );
  }

  @override
  Override overrideWith(AddKycVerificationScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddKycVerificationScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AddKycVerificationScreenController,
      void> createElement() {
    return _AddKycVerificationScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddKycVerificationScreenControllerProvider &&
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
mixin AddKycVerificationScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `existLeadId` of this provider.
  int get existLeadId;
}

class _AddKycVerificationScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        AddKycVerificationScreenController,
        void> with AddKycVerificationScreenControllerRef {
  _AddKycVerificationScreenControllerProviderElement(super.provider);

  @override
  int get existLeadId =>
      (origin as AddKycVerificationScreenControllerProvider).existLeadId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
