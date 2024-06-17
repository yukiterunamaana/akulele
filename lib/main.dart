import 'dart:typed_data';

import 'package:akulele/neck.dart';
import 'package:akulele/tunings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final _flutterMidi = FlutterMidi();
  final String _value = 'assets/Caed_s_Ukulele.sf2';

  @override
  void initState() {
    _flutterMidi.prepare(sf2: null);
    super.initState();
  }
  void load(String asset) async {
    print('Loading File...');
    _flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    _flutterMidi.prepare(sf2: _byte, name: _value.replaceAll('assets/', ''));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GuitarNeckWidget(tuning: cTuning, flutterMidi: _flutterMidi,));
  }
}
