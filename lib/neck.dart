import 'package:akulele/string.dart';
import 'package:akulele/logic.dart';
import 'package:flutter/material.dart';
import 'package:music_notes/music_notes.dart' as m;

class GuitarNeckWidget extends StatelessWidget {
  //final List<LogicalKeyboardKey> keyrows;
  final List<m.Note> tuning;
  int octave;

  GuitarNeckWidget({super.key, required this.tuning, this.octave = 4});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        StringWidget(p: tuning[0], keys: row0, octave: octave),
        StringWidget(p: tuning[1], keys: row1, octave: octave),
        StringWidget(p: tuning[2], keys: row2, octave: octave),
        StringWidget(p: tuning[3], keys: row3, octave: octave),
      ],
    );
  }
}
