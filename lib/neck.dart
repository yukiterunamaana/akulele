import 'package:akulele/string.dart';
import 'package:akulele/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:music_notes/music_notes.dart' as m;

class GuitarNeckWidget extends StatelessWidget {
  final List<int> tuning;
  final FlutterMidi flutterMidi;
  final int octave;

  const GuitarNeckWidget({super.key, required this.tuning, this.octave = 4, required this.flutterMidi});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        StringWidget(p: tuning[0], keys: row0, flutterMidi: flutterMidi,),
        StringWidget(p: tuning[1], keys: row1, flutterMidi: flutterMidi,),
        StringWidget(p: tuning[2], keys: row2, flutterMidi: flutterMidi,),
        StringWidget(p: tuning[3], keys: row3, flutterMidi: flutterMidi,),
      ],
    );
  }
}
