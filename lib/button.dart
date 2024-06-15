import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_notes/music_notes.dart' as m;

class FretWidget extends StatefulWidget {
  final m.Pitch note;
  final LogicalKeyboardKey kbKey;
  final int octave;
  const FretWidget(
      {super.key,
      required this.note,
      required this.kbKey,
      required this.octave});

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

  @override
  Widget build(BuildContext context) {
    String label = widget.note.toString().replaceAll(RegExp(r'[0-9]'), '');
    double size = 32 / label.length;
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      child: Container(
        width: 100,
        height: 80,
        child: ElevatedButton(
          //color: Colors.blue.shade100,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.octave < widget.note.octave
                ? Colors.purple.shade100
                : Colors.purple.shade200,
            //shape: const CircleBorder(),
          ),
          child: Text(
            label,
            style: TextStyle(fontSize: 32, fontFamily: 'JetBrains Mono'),
          ),
          onPressed: () {
            print(
                '${widget.note} pressed'); //, MIDI code ${widget.note.frequency}');
          },
        ),
      ),
    );
  }
}
