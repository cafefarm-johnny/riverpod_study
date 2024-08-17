import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linked_scroll/entities/profile.dart';
import 'package:linked_scroll/providers/user_provider.dart';

// ConsumerWidget, ConsumerStatefulWidget은 불필요한 Consumer 위젯 작성 코드를 줄이기 위해
// 각각 StatelessWidget, StatefulWidget에 Consumer를 상속받아 구현된 위젯이다.
class ConsumerUserList extends ConsumerWidget {
  const ConsumerUserList({super.key});

  // Consumer를 통해 Ref에 접근했던 방식이 build 메서드를 오버라이딩하며 접근할 수 있게 되었다.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Profile>> profiles = ref.watch(
      fetchProfilesProvider,
    );

    // UI 로직은 user_list.dart 버전과 동일하다. (= UI로직 변경 없이 Consumer만 제거되었다.)
    return Center(
      child: switch (profiles) {
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
        AsyncError() => const Text('Error occur!'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
