import 'dart:ffi';

import 'package:akulele/main.dart';
import 'package:akulele/midi.dart';
import 'package:akulele/scales.dart';
import 'package:akulele/tunings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi_pro/flutter_midi_pro.dart';
import 'package:music_notes/music_notes.dart' as m;

class FretWidget extends StatefulWidget {
  //final int note;
  final ValueNotifier<List<String>> scale;
  final ValueNotifier<List<int>> tuning;

  final int stringNumber;
  final int fretPosition;

  //final int octave;
  //final FlutterMidi flutterMidi;
  const FretWidget({
    super.key,
    //required this.note,
    required this.stringNumber,
    required this.fretPosition,
    required this.scale,
    required this.tuning,
    //required FlutterMidi flutterMidi, //required this.flutterMidi
  });

  @override
  _FretWidgetState createState() {
    return _FretWidgetState();
  }
}

class _FretWidgetState extends State<FretWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String midiNumberToNoteName(int midiNumber) {
    final notes = chromaticScale;
    return notes[midiNumber % 12];
  }

  @override
  Widget build(BuildContext context) {
    // String label = midiNumberToNoteName(widget.note);
    // label = label.split('').reversed.join()[0];

    String label = '';
    int midi = 0;
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.all(5),
        child: SizedBox(
            //width: 150,
            height: 75,
            child: ValueListenableBuilder(
                valueListenable: widget.scale,
                builder: (BuildContext context, value, Widget? child) {
                  return ValueListenableBuilder(
                      valueListenable: widget.tuning,
                      builder: (BuildContext context, value, child) {
                        midi = widget.tuning.value[widget.stringNumber] +
                            widget.fretPosition;
                        label = midiNumberToNoteName(midi);

                        return (widget.scale.value.contains(label))
                            ? ElevatedButton(
                                //color: Colors.blue.shade100,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        // widget.octave < widget.note.octave
                                        //     ?
                                        Colors.purple.shade100
                                    //  : Colors.purple.shade200,
                                    //shape: const CircleBorder(),
                                    ),
                                child: Text(
                                    //'$value',
                                    label.split('').reversed.join()[0]),
                                //),

                                onPressed: () async {
                                  await MidiPro().playNote(
                                      sfId: soundfontId,
                                      channel: 0,
                                      key: 60,
                                      velocity: 127);
                                  print(
                                      '${midi} pressed'); //, MIDI code ${widget.note.frequency}');
                                  //},
                                })
                            : Container();

                        //:Container();
                      });
                })));
  }
}
