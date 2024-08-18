// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userNotifierHash() => r'99ab39ac7d8c07e6876affb49c4ed9510089e9cc';

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

abstract class _$UserNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Profile>> {
  late final int size;

  FutureOr<List<Profile>> build([
    int size = 0,
  ]);
}

/// 네트워크 처리는 비즈니스 로직에 해당한다.
/// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
///
/// Copied from [UserNotifier].
@ProviderFor(UserNotifier)
const userNotifierProvider = UserNotifierFamily();

/// 네트워크 처리는 비즈니스 로직에 해당한다.
/// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
///
/// Copied from [UserNotifier].
class UserNotifierFamily extends Family<AsyncValue<List<Profile>>> {
  /// 네트워크 처리는 비즈니스 로직에 해당한다.
  /// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
  ///
  /// Copied from [UserNotifier].
  const UserNotifierFamily();

  /// 네트워크 처리는 비즈니스 로직에 해당한다.
  /// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
  ///
  /// Copied from [UserNotifier].
  UserNotifierProvider call([
    int size = 0,
  ]) {
    return UserNotifierProvider(
      size,
    );
  }

  @override
  UserNotifierProvider getProviderOverride(
    covariant UserNotifierProvider provider,
  ) {
    return call(
      provider.size,
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
  String? get name => r'userNotifierProvider';
}

/// 네트워크 처리는 비즈니스 로직에 해당한다.
/// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
///
/// Copied from [UserNotifier].
class UserNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserNotifier, List<Profile>> {
  /// 네트워크 처리는 비즈니스 로직에 해당한다.
  /// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
  ///
  /// Copied from [UserNotifier].
  UserNotifierProvider([
    int size = 0,
  ]) : this._internal(
          () => UserNotifier()..size = size,
          from: userNotifierProvider,
          name: r'userNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userNotifierHash,
          dependencies: UserNotifierFamily._dependencies,
          allTransitiveDependencies:
              UserNotifierFamily._allTransitiveDependencies,
          size: size,
        );

  UserNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.size,
  }) : super.internal();

  final int size;

  @override
  FutureOr<List<Profile>> runNotifierBuild(
    covariant UserNotifier notifier,
  ) {
    return notifier.build(
      size,
    );
  }

  @override
  Override overrideWith(UserNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserNotifierProvider._internal(
        () => create()..size = size,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        size: size,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserNotifier, List<Profile>>
      createElement() {
    return _UserNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserNotifierProvider && other.size == size;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, size.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserNotifierRef on AutoDisposeAsyncNotifierProviderRef<List<Profile>> {
  /// The parameter `size` of this provider.
  int get size;
}

class _UserNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserNotifier, List<Profile>>
    with UserNotifierRef {
  _UserNotifierProviderElement(super.provider);

  @override
  int get size => (origin as UserNotifierProvider).size;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
