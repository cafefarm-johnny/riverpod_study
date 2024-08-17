import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linked_scroll/entities/profile.dart';
import 'package:linked_scroll/providers/user_provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Consumer 위젯을 통해 Ref에 접근하고
    return Consumer(
      builder: (context, ref, child) {
        // 2. 필요로 하는 Provider를 조회한다.
        final AsyncValue<List<Profile>> profiles = ref.watch(
          fetchProfilesProvider,
        );

        return Center(
          // 3. 패턴매칭을 사용하여 각 상태에 따른 위젯을 반환한다.
          child: switch (profiles) {
            // 3-1. API 통신에 성공했다면 ListView를 반환한다.
            AsyncData(:final value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(value[index].url),
                    ),
                    title: Text(value[index].nickname),
                    subtitle: Text(value[index].statusMessage),
                  );
                },
              ),
            // 3-2. API 통신에 실패했다면 에러 메시지를 반환한다.
            AsyncError() => const Text('Error occur!'),
            // 3-3. 통신 과정 중이라면 로딩 인디케이터를 반환한다.
            _ => const CircularProgressIndicator(),
          },
        );
      },
    );

    /*
    주요사항
    - Consumer 위젯은 Provider가 업데이트될 때 마다 re-build를 수행한다.
    - Provider는 Lazy 형태로 동작한다. 따라서 해당 Provider를 사용하는 위젯이 없다면 네트워크 요청이 수행되지 않는다.
    - 요청이 수행된 후 결과는 캐싱되어 이후 Provider를 호출하더라도 네트워크 요청이 수행되지 않는다.
    - UI가 Provider를 사용하지 않으면 캐시는 삭제된다. 즉, 다시 UI가 Provider를 사용할 때 네트워크 요청이 수행된다.
    - 통신에 오류가 발생할 경우 Provider 내부에서 오류를 처리하고 AsyncError를 반환한다.
     */
  }
}
