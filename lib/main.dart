import 'package:akulele/neck.dart';
import 'package:akulele/tunings.dart';
import 'package:flutter/material.dart';

// class UkuleleSimulator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return KeyboardListener(
//         focusNode: FocusNode(),
//         child: // your ukulele simulator UI
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GuitarNeckWidget(tuning: cTuning));
  }
}
