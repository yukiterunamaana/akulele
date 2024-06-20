import 'package:akulele/widgets/string.dart';
import 'package:flutter/material.dart';

class GuitarNeckWidget extends StatelessWidget {
  final ValueNotifier<List<String>> scale;
  final ValueNotifier<List<int>> tuning;

  //final FlutterMidi flutterMidi;

  const GuitarNeckWidget({
    super.key,
    required this.scale,
    required this.tuning, // required this.flutterMidi
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
          stringNumber: 0,
        ),
        StringWidget(
          //flutterMidi: flutterMidi,
          scale: scale,
          tuning: tuning,
          stringNumber: 1,
        ),
        StringWidget(
          //flutterMidi: flutterMidi,
          scale: scale,
          tuning: tuning,
          stringNumber: 2,
        ),
        StringWidget(
          //flutterMidi: flutterMidi,
          scale: scale,
          tuning: tuning,
          stringNumber: 3,
        ),
      ],
    );
  }
}
