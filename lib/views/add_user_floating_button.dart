import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linked_scroll/entities/profile.dart';
import 'package:linked_scroll/providers/user_provider.dart';

class AddUserFloatingButton extends ConsumerStatefulWidget {
  const AddUserFloatingButton({super.key});

  @override
  ConsumerState<AddUserFloatingButton> createState() =>
      _AddUserFloatingButtonState();
}

class _AddUserFloatingButtonState extends ConsumerState<AddUserFloatingButton> {
  int _count = 0;

  void addUserRandomly(WidgetRef ref) {
    _count++;

    Profile newProfile = Profile(
      nickname: 'Jay$_count',
      statusMessage: '반가워요!!',
      url: 'https://via.placeholder.com/200/000000/FFFFFF/?text=Jay$_count',
    );

    // ref.read를 사용하여 notifier에 접근한다.
    // notifier에 접근하여 addUser 메서드를 호출한다.
    ref.read(userNotifierProvider(5).notifier).addUser(newProfile);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => addUserRandomly(ref),
      child: const Icon(Icons.add),
    );
  }
}
