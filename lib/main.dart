import 'package:akulele/widgets/neck.dart';
import 'package:akulele/tunings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_midi/flutter_midi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //final _flutterMidi = FlutterMidi();
  final String _value = 'assets/Caed_s_Ukulele.sf2';
  bool strum = false;
  bool keyboard = true;

  @override
  void initState() {
    // _flutterMidi.prepare(sf2: null);
    // load(_value);
    super.initState();
  }

  void load(String asset) async {
    print('Loading File...');
    //_flutterMidi.unmute();
    ByteData byte = await rootBundle.load(asset);
    //_flutterMidi.prepare(sf2: byte, name: _value.replaceAll('assets/', ''));
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (keyEvent) {
        if (keyEvent is KeyDownEvent) {
          print('Key pressed: ${keyEvent.logicalKey}');
        } else if (keyEvent is KeyUpEvent) {
          print('Key released: ${keyEvent.logicalKey}');
        }
      },
      child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text('App Bar with Switch'),
                actions: [
                  Tooltip(
                    message: strum ? 'Strum' : 'Pluck',
                    child: Switch(
                      value: strum,
                      onChanged: (value) {
                        setState(() {
                          strum = value;
                        });
                      },
                    ),
                  ),
                  Tooltip(
                    message: keyboard ? 'Use keyboard keys' : 'Use buttons',
                    child: Switch(
                      value: keyboard,
                      onChanged: (value) {
                        setState(() {
                          keyboard = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              body: GuitarNeckWidget(
                tuning: cTuning,
                //flutterMidi: _flutterMidi,
              ))),
    );
  }
}
