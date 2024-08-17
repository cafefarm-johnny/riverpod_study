// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userNotifierHash() => r'f1144a8b8405697f76aa3b45aad93a15a1d29049';

/// 네트워크 처리는 비즈니스 로직에 해당한다.
/// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
///
/// Copied from [UserNotifier].
@ProviderFor(UserNotifier)
final userNotifierProvider =
    AutoDisposeAsyncNotifierProvider<UserNotifier, List<Profile>>.internal(
  UserNotifier.new,
  name: r'userNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserNotifier = AutoDisposeAsyncNotifier<List<Profile>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
