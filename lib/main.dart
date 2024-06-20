import 'package:akulele/midi.dart';
import 'package:akulele/midi_example.dart';
import 'package:akulele/scales.dart';
import 'package:akulele/widgets/neck.dart';
import 'package:akulele/tunings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi_pro/flutter_midi_pro.dart';

void main() {
  //runApp(MyPianoApp());
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
  final midiPro = MidiPro();
  final String _value = path;
  bool strum = false;
  // List<int> selectedTuning = cTuning;
  // List<String> selectedScale = chromaticScale;

  final ValueNotifier<List<String>> scale = ValueNotifier(chromaticScale);
  final ValueNotifier<List<int>> tuning = ValueNotifier(cTuning);

  // Scale scale = Scale();

  // Tuning tuning = Tuning();

  @override
  void initState() {
    // _flutterMidi.prepare(sf2: null);
    super.initState();
    load(_value);
  }

  void load(String asset) async {
    print('Loading File...');
    //_flutterMidi.unmute();
    //ByteData byte = await rootBundle.load(asset);
    //_flutterMidi.prepare(sf2: byte, name: _value.replaceAll('assets/', ''));
  }

  // Future<void> loadSoundFontAndPlayNote() async {
  //   final soundfontId = await MidiPro()
  //       .loadSoundfont(path: 'assets/Caed_s_Ukulele.sf2', bank: 0, program: 0);
  //   await MidiPro()
  //       .selectInstrument(sfId: soundfontId, channel: 0, bank: 0, program: 0);
  //   MidiPro().playNote(sfId: soundfontId, channel: 0, key: 60, velocity: 127);
  //   //MidiPro().stopNote(sfId: soundfontId, channel: 0, key: 60);
  // }

  @override
  Widget build(BuildContext context) {
    //loadSoundFontAndPlayNote(bankIndex.value, instrumentIndex.value);

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              actions: [
                DropdownButton<List<String>>(
                  value: chromaticScale, // Initialize with a default value
                  onChanged: (newValue) {
                    setState(() {
                      scale.value = newValue!;
                    });
                  },
                  items: [
                    DropdownMenuItem<List<String>>(
                      value: chromaticScale,
                      child: Text('Chromatic'),
                    ),
                    DropdownMenuItem<List<String>>(
                      value: cMajorScale,
                      child: Text('C major'),
                    ),
                    DropdownMenuItem<List<String>>(
                      value: cMajorPentatonicScale,
                      child: Text('C major pentatonic'),
                    ),
                    // Add more items as needed
                  ],
                ),
                DropdownButton<List<int>>(
                  value: cTuning, // Initialize with a default value
                  onChanged: (newValue) {
                    setState(() {
                      tuning.value = newValue!;
                    });
                  },
                  items: [
                    DropdownMenuItem<List<int>>(
                      value: cTuning,
                      child: Text('C Tuning'),
                    ),
                    DropdownMenuItem<List<int>>(
                      value: dTuning,
                      child: Text('D Tuning'),
                    ),
                    DropdownMenuItem<List<int>>(
                      value: gTuning,
                      child: Text('G Tuning'),
                    ),
                    DropdownMenuItem<List<int>>(
                      value: aSharpTuning,
                      child: Text('A# Tuning'),
                    ),
                    DropdownMenuItem<List<int>>(
                      value: slackKeyTuning,
                      child: Text('Slack Tuning (GCEG)'),
                    ),
                    DropdownMenuItem<List<int>>(
                      value: lowGTuning,
                      child: Text('Low G Tuning'),
                    ),
                    // Add more items as needed
                  ],
                ),
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
              ],
            ),
            body: GuitarNeckWidget(
              //tuning_list: cTuning,
              scale: scale,
              tuning: tuning,
              //flutterMidi: _flutterMidi,
            )));
  }
}
