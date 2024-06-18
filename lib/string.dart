import 'package:akulele/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:music_notes/music_notes.dart' as m;

class StringWidget extends StatefulWidget {
  final int p;
  final List<LogicalKeyboardKey> keys;
  //final int octave;
  final FlutterMidi flutterMidi;
  const StringWidget(
      {super.key, required this.p, required this.keys, required this.flutterMidi});

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

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    List<int> notes = [];

    for (int i=0; i<10; i++) {
      notes.add(widget.p+i);
    }
    return Row(
      children: [
      FretWidget(
      note: notes[0],
      kbKey: widget.keys[0],
      flutterMidi: widget.flutterMidi,),
      const Spacer(),
        FretWidget(
          note: notes[1],
          kbKey: widget.keys[1],
          flutterMidi: widget.flutterMidi,),

        FretWidget(
          note: notes[2],
          kbKey: widget.keys[2],
          flutterMidi: widget.flutterMidi,),

        FretWidget(
          note: notes[3],
          kbKey: widget.keys[3],
          flutterMidi: widget.flutterMidi,),

        FretWidget(
          note: notes[4],
          kbKey: widget.keys[4],
          flutterMidi: widget.flutterMidi,),

        FretWidget(
          note: notes[5],
          kbKey: widget.keys[5],
          flutterMidi: widget.flutterMidi,),

        FretWidget(
          note: notes[6],
          kbKey: widget.keys[6],
          flutterMidi: widget.flutterMidi,),

        FretWidget(
          note: notes[7],
          kbKey: widget.keys[7],
          flutterMidi: widget.flutterMidi,),

        FretWidget(
          note: notes[8],
          kbKey: widget.keys[8],
          flutterMidi: widget.flutterMidi,),

        FretWidget(
          note: notes[9],
          kbKey: widget.keys[9],
          flutterMidi: widget.flutterMidi,),


        // List.generate(10, (index) {
      //   return FretWidget(
      //       note: notes[index],
      //       kbKey: widget.keys[index],
      //       flutterMidi: widget.flutterMidi,);
      // }),
      ],
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
