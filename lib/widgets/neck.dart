import 'package:akulele/widgets/string.dart';
import 'package:flutter/material.dart';

class GuitarNeckWidget extends StatelessWidget {
  final List<int> tuning;
  //final FlutterMidi flutterMidi;

  const GuitarNeckWidget({
    super.key,
    required this.tuning, // required this.flutterMidi
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        StringWidget(
          note: tuning[0],
          //flutterMidi: flutterMidi,
          label: '<-',
        ),
        StringWidget(
          note: tuning[1],
          //flutterMidi: flutterMidi,
          label: '^',
        ),
        StringWidget(
          note: tuning[2],
          //flutterMidi: flutterMidi,
          label: 'v',
        ),
        StringWidget(
          note: tuning[3],
          //flutterMidi: flutterMidi,
          label: '->',
        ),
      ],
    );
  }
}
