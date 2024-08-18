import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:linked_scroll/entities/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

/// 네트워크 처리는 비즈니스 로직에 해당한다.
/// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.

// 1. provider를 class로 승격하여 Notifier로 변경한다.
@riverpod
class UserNotifier extends _$UserNotifier {
  final List<Profile> _db = [];

  // 2. 이전에 있었던 fetchProfilesProvider 데이터 fetch 로직을 build 메서드로 이동한다.
  @override
  Future<List<Profile>> build([int size = 0]) async {
    // 매개변수를 받고자 하면 그냥 선언하면 된다.
    return await _fetch(size);
  }

  Future<List<Profile>> _fetch(int size) async {
    final response = await http.get(
      Uri.parse(
        'https://gist.githubusercontent.com/'
        'cafefarm-johnny/'
        'ad6ca270049e3fbd24be0cae2e20fd6d/'
        'raw/'
        'e20114cc476ddb54cdc33bf2223dfc55c74074a3/'
        'chat_app_peoples_data.json',
      ),
    );

    if (kDebugMode) {
      print('status code: ${response.statusCode}');
      print('response body: ${response.body}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final rawProfiles = json['Johnny'] as List<dynamic>;

    if (rawProfiles.isEmpty) {
      return List.empty();
    }

    return rawProfiles
        .sublist(0, size == 0 ? rawProfiles.length : size)
        .map((rawProfile) => Profile.fromJson(rawProfile))
        .toList()
      ..addAll(_db);
  }

  // 3. Create, Update, Delete 로직을 추가한다.
  Future<void> addUser(Profile profile) async {
    // (저장) like 네트워크 통신 처리
    Future.delayed(const Duration(seconds: 3));
    _db.add(profile);

    // POST 요청이 완료되면 로컬 캐시를 Dirty 상태로 변경한다.
    // 로컬 캐시가 Dirty 상태로 변경되면 notifier의 build 메서드가 비동기적으로 재호출되며,
    // 리스너들에게 변경사항을 전달한다.
    ref.invalidateSelf();

    // 상태가 새로 갱신될 때 까지 대기한다.
    await future;
  }
}
