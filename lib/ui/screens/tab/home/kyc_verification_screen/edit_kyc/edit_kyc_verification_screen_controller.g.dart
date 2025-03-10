// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_kyc_verification_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editKycVerificationScreenControllerHash() =>
    r'374158f8020691f0c8fbf2fe85e89408f96d7078';

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

abstract class _$EditKycVerificationScreenController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final int existLeadId;

  FutureOr<void> build({
    required int existLeadId,
  });
}

/// See also [EditKycVerificationScreenController].
@ProviderFor(EditKycVerificationScreenController)
const editKycVerificationScreenControllerProvider =
    EditKycVerificationScreenControllerFamily();

/// See also [EditKycVerificationScreenController].
class EditKycVerificationScreenControllerFamily
    extends Family<AsyncValue<void>> {
  /// See also [EditKycVerificationScreenController].
  const EditKycVerificationScreenControllerFamily();

  /// See also [EditKycVerificationScreenController].
  EditKycVerificationScreenControllerProvider call({
    required int existLeadId,
  }) {
    return EditKycVerificationScreenControllerProvider(
      existLeadId: existLeadId,
    );
  }

  @override
  EditKycVerificationScreenControllerProvider getProviderOverride(
    covariant EditKycVerificationScreenControllerProvider provider,
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
  String? get name => r'editKycVerificationScreenControllerProvider';
}

/// See also [EditKycVerificationScreenController].
class EditKycVerificationScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        EditKycVerificationScreenController, void> {
  /// See also [EditKycVerificationScreenController].
  EditKycVerificationScreenControllerProvider({
    required int existLeadId,
  }) : this._internal(
          () =>
              EditKycVerificationScreenController()..existLeadId = existLeadId,
          from: editKycVerificationScreenControllerProvider,
          name: r'editKycVerificationScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editKycVerificationScreenControllerHash,
          dependencies: EditKycVerificationScreenControllerFamily._dependencies,
          allTransitiveDependencies: EditKycVerificationScreenControllerFamily
              ._allTransitiveDependencies,
          existLeadId: existLeadId,
        );

  EditKycVerificationScreenControllerProvider._internal(
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
    covariant EditKycVerificationScreenController notifier,
  ) {
    return notifier.build(
      existLeadId: existLeadId,
    );
  }

  @override
  Override overrideWith(EditKycVerificationScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditKycVerificationScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<EditKycVerificationScreenController,
      void> createElement() {
    return _EditKycVerificationScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditKycVerificationScreenControllerProvider &&
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
mixin EditKycVerificationScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `existLeadId` of this provider.
  int get existLeadId;
}

class _EditKycVerificationScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        EditKycVerificationScreenController,
        void> with EditKycVerificationScreenControllerRef {
  _EditKycVerificationScreenControllerProviderElement(super.provider);

  @override
  int get existLeadId =>
      (origin as EditKycVerificationScreenControllerProvider).existLeadId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
