import 'package:akulele/widgets/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midi_pro/flutter_midi_pro.dart';

class GuitarNeckWidget extends StatelessWidget {
  final ValueNotifier<List<String>> scale;
  final ValueNotifier<List<int>> tuning;
  final ValueNotifier<MidiPro> midiProNotifier;
  final ValueNotifier<int> soundfontIdNotifier;

  //final FlutterMidi flutterMidi;

  const GuitarNeckWidget({
    super.key,
    required this.scale,
    required this.tuning,
    required this.midiProNotifier,
    required this.soundfontIdNotifier, // required this.flutterMidi
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        StringWidget(
          //flutterMidi: flutterMidi,
          scale: scale,
          tuning: tuning,
          midiProNotifier: midiProNotifier,
          soundfontIdNotifier: soundfontIdNotifier,
          stringNumber: 0,
        ),
        StringWidget(
          //flutterMidi: flutterMidi,
          scale: scale,
          tuning: tuning,
          midiProNotifier: midiProNotifier,
          soundfontIdNotifier: soundfontIdNotifier,
          stringNumber: 1,
        ),
        StringWidget(
          //flutterMidi: flutterMidi,
          scale: scale,
          tuning: tuning,
          midiProNotifier: midiProNotifier,
          soundfontIdNotifier: soundfontIdNotifier,
          stringNumber: 2,
        ),
        StringWidget(
          //flutterMidi: flutterMidi,
          scale: scale,
          tuning: tuning,
          midiProNotifier: midiProNotifier,
          soundfontIdNotifier: soundfontIdNotifier,
          stringNumber: 3,
        ),
      ],
    );
  }
}
