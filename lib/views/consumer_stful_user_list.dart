import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linked_scroll/entities/profile.dart';
import 'package:linked_scroll/providers/user_provider.dart';

class ConsumerStfulUserList extends ConsumerStatefulWidget {
  const ConsumerStfulUserList({super.key});

  @override
  ConsumerState createState() => _ConsumerStfulUserListState();
}

// 1. State 대신 ConsumerState를 확장한다.
class _ConsumerStfulUserListState extends ConsumerState<ConsumerStfulUserList> {
  @override
  void initState() {
    super.initState();

    // 2. 라이프사이클 과정에서 Ref에 접근할 수 있다.
    ref.listenManual(userNotifierProvider, (previous, next) async {
      if (next.isLoading || next.isReloading || next.isRefreshing) {
        return;
      }

      // Provider에 리스너를 등록하여 스낵바 등을 구현할 수 있다.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('최신 친구 목록을 조회했습니다.'),
        ),
      );
    });
  }

  // 3. ConsumerStatefulWidget에서는 Ref가 build 메서드의 매개변수로 제공되지 않고,
  // ConsumerState의 프로퍼티로써 접근할 수 있다.
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Profile>> profiles = ref.watch(
      userNotifierProvider,
    );

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
