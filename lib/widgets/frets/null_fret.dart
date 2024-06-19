import 'package:akulele/main.dart';
import 'package:akulele/midi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_notes/music_notes.dart' as m;

class NullFretWidget extends StatefulWidget {
  final int note;
  //final int octave;
  //final FlutterMidi flutterMidi;
  final String label;
  const NullFretWidget({
    super.key,
    required this.note,
    //required this.flutterMidi,
    required this.label,
    //required FlutterMidi flutterMidi
  });

  @override
  _NullFretWidgetState createState() {
    return _NullFretWidgetState();
  }
}

class _NullFretWidgetState extends State<NullFretWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String midiNumberToNoteName(int midiNumber) {
    final notes = [
      'C',
      'C#',
      'D',
      'D#',
      'E',
      'F',
      'F#',
      'G',
      'G#',
      'A',
      'A#',
      'B'
    ];
    return notes[midiNumber % 12];
  }

  @override
  Widget build(BuildContext context) {
    String label =
        midiNumberToNoteName(widget.note); //.replaceAll(RegExp(r'[0-9]'), '');
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 150,
        height: 75,
        child: ElevatedButton(
          //color: Colors.blue.shade100,
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  // widget.octave < widget.note.octave
                  //     ?
                  Colors.purple.shade300
              //  : Colors.purple.shade200,
              //shape: const CircleBorder(),
              ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 48, fontFamily: 'JetBrains Mono'),
          ),
          onPressed: () {
            //widget.flutterMidi.playMidiNote(midi: 60);
            //play();
            print(
                '${widget.note} pressed'); //, MIDI code ${widget.note.frequency}');
          },
        ),
      ),
    );
  }
}
