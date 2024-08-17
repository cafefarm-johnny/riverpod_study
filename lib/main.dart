import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linked_scroll/views/user_list.dart';

void main() {
  runApp(
    const ProviderScope(
      // 위젯에서 providers를 읽을 수 있게 전체 앱을 ProviderScope으로 감싼다.
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("example"),
        ),
        body: const UserList(),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 400,
//               child: InfiniteCarousel.builder(
//                 anchor: 0.05,
//                 loop: false,
//                 physics: const PageViewTypeScrollPhysics(),
//                 itemExtent: 300,
//                 itemCount: 6,
//                 itemBuilder: (context, index, real) {
//                   return Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(right: 10),
//                         width: 300,
//                         height: 100,
//                         color: Colors
//                             .primaries[Random().nextInt(Colors.accents.length)],
//                         child: Center(
//                           child: Text(
//                             index.toString(),
//                             style: Theme.of(context).textTheme.headlineLarge,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       real < 5
//                           ? Container(
//                               padding: const EdgeInsets.only(right: 10),
//                               width: 300,
//                               height: 100,
//                               color: Colors.primaries[
//                                   Random().nextInt(Colors.accents.length)],
//                               child: Center(
//                                 child: Text(
//                                   index.toString(),
//                                   style:
//                                       Theme.of(context).textTheme.headlineLarge,
//                                 ),
//                               ),
//                             )
//                           : const SizedBox.shrink(),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
