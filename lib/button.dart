import 'package:akulele/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:music_notes/music_notes.dart' as m;

class FretWidget extends StatefulWidget {
  final int note;
  final LogicalKeyboardKey kbKey;
  //final int octave;
  final FlutterMidi flutterMidi;
  const FretWidget(
      {super.key,
      required this.note,
      required this.kbKey, required this.flutterMidi});

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
    final notes = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
    return notes[midiNumber % 12];
  }

  @override
  Widget build(BuildContext context) {
    String label = midiNumberToNoteName(widget.note);//.replaceAll(RegExp(r'[0-9]'), '');
    double size = 32 / label.length;
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 100,
        height: 80,
        child: ElevatedButton(
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
            label,
            style: const TextStyle(fontSize: 32, fontFamily: 'JetBrains Mono'),
          ),
          onPressed: () {
            widget.flutterMidi.playMidiNote(midi: 60);
            print(
                '${widget.note} pressed'); //, MIDI code ${widget.note.frequency}');
          },
        ),
      ),
    );
  }
}
