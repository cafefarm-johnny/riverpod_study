import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:linked_scroll/entities/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

/// 네트워크 처리는 비즈니스 로직에 해당한다.
/// Riverpod에서 비즈니스 로직은 provider 내부에 작성한다.
@riverpod
Future<List<Profile>> fetchProfiles(FetchProfilesRef ref) async {
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

  return rawProfiles.map((rawProfile) => Profile.fromJson(rawProfile)).toList();
}
