import 'package:flutter/material.dart';

class Tuning {
  final ValueNotifier<List<int>> tuning = ValueNotifier<List<int>>(cTuning);
  void setTuning(List<int> t) => tuning.value = t;
}

List<int> cTuning = [
  69,
  64,
  60,
  67,
];
List<int> dTuning = [
  71,
  66,
  62,
  69,
];
List<int> gTuning = [
  64,
  71,
  67,
  62,
];
List<int> aSharpTuning = [
  67,
  62,
  70,
  65,
];
List<int> slackKeyTuning = [
  67,
  64,
  60,
  67,
];

List<int> lowGTuning = [
  69,
  64,
  60,
  55,
];
