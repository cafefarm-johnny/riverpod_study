// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchProfilesHash() => r'0c824e59a06b8353f02c30c1d7804152e4954254';

/// 네트워크 처리는 비즈니스 로직에 해당한다.
/// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
///
/// Copied from [fetchProfiles].
@ProviderFor(fetchProfiles)
final fetchProfilesProvider = AutoDisposeFutureProvider<List<Profile>>.internal(
  fetchProfiles,
  name: r'fetchProfilesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProfilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProfilesRef = AutoDisposeFutureProviderRef<List<Profile>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
