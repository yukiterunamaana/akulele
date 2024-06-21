import 'package:flutter/material.dart';
import 'package:flutter_midi_pro/flutter_midi_pro.dart';

late int soundfontId = 1;
final MidiPro midiPro = MidiPro();
final String path = 'assets/Chris.sf2';

// final ValueNotifier<Map<int, String>> loadedSoundfonts =
//     ValueNotifier<Map<int, String>>({});
// final ValueNotifier<int?> selectedSfId = ValueNotifier<int?>(null);
// final instrumentIndex = ValueNotifier<int>(0);
// final bankIndex = ValueNotifier<int>(0);
// final channelIndex = ValueNotifier<int>(0);
// final volume = ValueNotifier<int>(127);

// Future<int> loadSoundFontAndPlayNote(String path, int bank, int program) async {
//   soundfontId = await MidiPro()
//       .loadSoundfont(path: 'assets/Caed_s_Ukulele.sf2', bank: 0, program: 0);
//   await MidiPro()
//       .selectInstrument(sfId: soundfontId, channel: 0, bank: 0, program: 0);
//
//   if (loadedSoundfonts.value.containsValue(path)) {
//     print('Soundfont file: $path already loaded. Returning ID.');
//     return loadedSoundfonts.value.entries
//         .firstWhere((element) => element.value == path)
//         .key;
//   }
//   final int sfId =
//       await midiPro.loadSoundfont(path: path, bank: bank, program: program);
//   loadedSoundfonts.value = {sfId: path, ...loadedSoundfonts.value};
//   print('Loaded soundfont file: $path with ID: $sfId');
//   return sfId;
// }
