import 'package:akulele/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_notes/music_notes.dart' as m;

class StringWidget extends StatefulWidget {
  final m.Note p;
  final List<LogicalKeyboardKey> keys;
  final int octave;
  const StringWidget(
      {super.key, required this.p, required this.keys, required this.octave});

  @override
  _StringWidgetState createState() {
    return _StringWidgetState();
  }
}

class _StringWidgetState extends State<StringWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<m.Pitch> notes = [];
    m.Pitch p = widget.p.inOctave(4);
    notes.add(p);
    notes.add(p.transposeBy(m.Interval.m2));
    notes.add(p.transposeBy(m.Interval.M2));
    notes.add(p.transposeBy(m.Interval.m3));
    notes.add(p.transposeBy(m.Interval.M3));
    notes.add(p.transposeBy(m.Interval.P4));
    notes.add(p.transposeBy(m.Interval.d5));
    notes.add(p.transposeBy(m.Interval.P5));
    notes.add(p.transposeBy(m.Interval.m6));
    notes.add(p.transposeBy(m.Interval.M6));
    notes.add(p.transposeBy(m.Interval.m7));
    // notes.add(widget.tune.transposeBy(m.Interval.M7));
    // notes.add(widget.tune.transposeBy(m.Interval.P8));
    return Row(
      children: List.generate(10, (index) {
        return FretWidget(
            note: notes[index],
            kbKey: widget.keys[index],
            octave: widget.octave);
      }),
    );

    // return GridView.builder(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 10,
    //   ),
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return FretWidget(note: widget.tune, kbKey: null,);
    //   },
    // );
  }
}
