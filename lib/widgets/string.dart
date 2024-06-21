import 'package:akulele/widgets/fret.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_notes/music_notes.dart' as m;

class StringWidget extends StatefulWidget {
  final ValueNotifier<List<String>> scale;
  final ValueNotifier<List<int>> tuning;
  final int stringNumber;
  //final int octave;
  //final FlutterMidi flutterMidi;
  const StringWidget({
    super.key,
    required this.scale,
    required this.tuning,
    required this.stringNumber,
    //required this.flutterMidi,
  });

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
    // frets.add(Flexible(
    //   flex: 2,
    //   child: Container(),
    //   // child: NullFretWidget(
    //   //   note: widget.note,
    //   //   //flutterMidi: widget.flutterMidi,
    //   // )
    // ));
    for (int i = 0; i <= 12; i++) {
      frets.add(FretWidget(
        stringNumber: widget.stringNumber, fretPosition: i,
        scale: widget.scale,
        tuning: widget.tuning,
        //flutterMidi: widget.flutterMidi,
      )); //(widget.note + i);
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
