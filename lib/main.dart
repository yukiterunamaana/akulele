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

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Pressed on Key Event'),
        ),
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (keyEvent) {
        if (keyEvent is KeyDownEvent && keyEvent.logicalKey == LogicalKeyboardKey.enter) {
          setState(() {
            _isPressed = true;
          });
        } else if (keyEvent is KeyUpEvent && keyEvent.logicalKey == LogicalKeyboardKey.enter) {
          setState(() {
            _isPressed = false;
          });
        }
      },
      child: ElevatedButton(
        onPressed: _isPressed ? null : () {
          // Button pressed action
          print('Button pressed');
        },
        child: Text('Press me'),
      ),
    );
  }
}

class UkuleleSimulator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(body:
    KeyboardListener(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Type something...',
        ),
      ),
      focusNode: FocusNode(),
      onKeyEvent:
          (keyEvent) {
        if (keyEvent is KeyDownEvent) {
          print('Key pressed: ${keyEvent.logicalKey}');
        } else if (keyEvent is KeyUpEvent) {
          print('Key released: ${keyEvent.logicalKey}');
        }
      },
    )
        ));
        //child: // your ukulele simulator UI
    //);
  }
}

void main() {
  //runApp(UkuleleSimulator());
  //runApp(KeebApp());
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
    _flutterMidi.playMidiNote(midi: 65);
  }

  @override
  Widget build(BuildContext context) {
    bool _switchValue=false;
    return

      KeyboardListener(
        child: MaterialApp(
            home: Scaffold(appBar: AppBar(
              title: Text('App Bar with Switch'),
              actions: [
                Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                Tooltip(
                  message: _switchValue ? 'Switch is ON' : 'Switch is OFF',
                  child: Icon(Icons.info),
                ),
              ],
            ),
                body: GuitarNeckWidget(tuning: cTuning, flutterMidi: _flutterMidi,)
            )),
        focusNode: FocusNode(),
        onKeyEvent:
            (keyEvent) {
          if (keyEvent is KeyDownEvent) {
            print('Key pressed: ${keyEvent.logicalKey}');
          } else if (keyEvent is KeyUpEvent) {
            print('Key released: ${keyEvent.logicalKey}');
          }
        },
      )

      ;
  }
}
