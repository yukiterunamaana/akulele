import 'package:akulele/neck.dart';
import 'package:akulele/tunings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';

/*
keyboardListener слушает клавиатуру, никаких струн и прочего не надо - 44 кнопки в 4*11 ряда
1-_
q-[
a-'
z-right shift
* */

void main() {
  //runApp(UkuleleSimulator());
  //runApp(KeebApp());
  runApp(MyApp());
}

// class MyApp2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Button Pressed on Key Event'),
//         ),
//         body: Center(
//           child: MyButton(),
//         ),
//       ),
//     );
//   }
// }
//
// class MyButton extends StatefulWidget {
//   @override
//   _MyButtonState createState() => _MyButtonState();
// }
//
// class _MyButtonState extends State<MyButton> {
//   bool _isPressed = false;
//   @override
//   Widget build(BuildContext context) {
//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (keyEvent) {
//         if (keyEvent is KeyDownEvent && keyEvent.logicalKey == LogicalKeyboardKey.enter) {
//           setState(() {
//             _isPressed = true;
//           });
//         } else if (keyEvent is KeyUpEvent && keyEvent.logicalKey == LogicalKeyboardKey.enter) {
//           setState(() {
//             _isPressed = false;
//           });
//         }
//       },
//       child: ElevatedButton(
//         onPressed: _isPressed ? null : () {
//           // Button pressed action
//           print('Button pressed');
//         },
//         child: Text('Press me'),
//       ),
//     );
//   }
// }
//
// class UkuleleSimulator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//         home: Scaffold(body:
//     KeyboardListener(
//       child: TextField(
//         decoration: InputDecoration(
//           labelText: 'Type something...',
//         ),
//       ),
//       focusNode: FocusNode(),
//       onKeyEvent:
//           (keyEvent) {
//         if (keyEvent is KeyDownEvent) {
//           print('Key pressed: ${keyEvent.logicalKey}');
//           //_flutterMidi.playMidiNote(midi: 65);
//         } else if (keyEvent is KeyUpEvent) {
//           print('Key released: ${keyEvent.logicalKey}');
//           //_flutterMidi.playMidiNote(midi: 65);
//         }
//       },
//     )
//         ));
//         //child: // your ukulele simulator UI
//     //);
//   }
// }
//
// class MyApp3 extends StatefulWidget {
//   @override
//   _MyApp3State createState() => _MyApp3State();
// }
//
// class _MyApp3State extends State<MyApp> {
//   final _flutterMidi = FlutterMidi();
//   @override
//   void initState() {
//     _flutterMidi.prepare(sf2: null);
//     super.initState();
//   }
//
//   void load(String asset) async {
//     print('Loading File...');
//     _flutterMidi.unmute();
//     ByteData _byte = await rootBundle.load(asset);
//     //assets/sf2/SmallTimGM6mb.sf2
//     //assets/sf2/Piano.SF2
//     _flutterMidi.prepare(sf2: _byte, name: _value.replaceAll('assets/', ''));
//   }
//
//   String _value = 'assets/Piano.sf2';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // DropdownButton<String>(
//                 //   value: _value,
//                 //   items: [
//                 //     DropdownMenuItem(
//                 //       child: Text("Soft Piano"),
//                 //       value: "assets/sf2/SmallTimGM6mb.sf2",
//                 //     ),
//                 //     DropdownMenuItem(
//                 //       child: Text("Loud Piano"),
//                 //       value: "assets/sf2/Piano.SF2",
//                 //     ),
//                 //   ],
//                 //   onChanged: (String value) {
//                 //     setState(() {
//                 //       _value = value;
//                 //     });
//                 //     load(_value);
//                 //   },
//                 // ),
//                 ElevatedButton(
//                   child: Text('Play C'),
//                   onPressed: () {
//                     _play(60);
//                   },
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
//
//   void _play(int midi) {
//       _flutterMidi.playMidiNote(midi: midi);
//   }
// }

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
    load(_value);
    super.initState();
  }
  void load(String asset) async {
    print('Loading File...');
    _flutterMidi.unmute();
    ByteData byte = await rootBundle.load(asset);
    _flutterMidi.prepare(sf2: byte, name: _value.replaceAll('assets/', ''));
  }

  @override
  Widget build(BuildContext context) {
    bool strum=false;
    bool keyboard=true;
    return
      KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent:
            (keyEvent) {
          if (keyEvent is KeyDownEvent) {
            print('Key pressed: ${keyEvent.logicalKey}');
          } else if (keyEvent is KeyUpEvent) {
            print('Key released: ${keyEvent.logicalKey}');
          }
        },
        child: MaterialApp(
            home: Scaffold(appBar: AppBar(
              title: Text('App Bar with Switch'),
              actions: [
                Tooltip(
                  message: strum ? 'Strum' : 'Pluck',
                  child:
                Switch(
                  value: strum,
                  onChanged: (value) {
                    setState(() {
                      strum = value;
                    });
                  },
                ),),
                Tooltip(
                  message: keyboard ? 'Use keyboard keys' : 'Use buttons',
                  child:
                  Switch(
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
                body: GuitarNeckWidget(tuning: cTuning, flutterMidi: _flutterMidi,)
            )),
      )

      ;
  }
}
