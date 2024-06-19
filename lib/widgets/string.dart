import 'package:akulele/widgets/frets/fret.dart';
import 'package:akulele/widgets/frets/null_fret.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_notes/music_notes.dart' as m;

class StringWidget extends StatefulWidget {
  final int note;
  //final int octave;
  //final FlutterMidi flutterMidi;
  final String label;
  const StringWidget(
      {super.key,
      required this.note,
      //required this.flutterMidi,
      required this.label});

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
    List<Widget> frets = [];
    frets.add(Flexible(
        flex: 2,
        child: NullFretWidget(
          note: widget.note,
          label: widget.label,
          //flutterMidi: widget.flutterMidi,
        )));
    frets.add(const Flexible(child: Divider()));
    for (int i = 1; i <= 12; i++) {
      frets.add(Flexible(
          flex: 2,
          child: FretWidget(
            note: widget.note + i,
            //flutterMidi: widget.flutterMidi,
          ))); //(widget.note + i);
    }
    return Row(children: frets);

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
