import 'package:flutter/material.dart';

class Scale {
  final ValueNotifier<List<String>> scale =
      ValueNotifier<List<String>>(chromaticScale);
  void setScale(List<String> s) => scale.value = s;
}

List<String> chromaticScale = [
  'C',
  'C#',
  'D',
  'D#',
  'E',
  'F',
  'F#',
  'G',
  'G#',
  'A',
  'A#',
  'B'
];
List<String> cMajorScale = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
List<String> cMajorPentatonicScale = ['C', 'D', 'E', 'G', 'A'];
