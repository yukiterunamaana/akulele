import 'package:music_notes/music_notes.dart';
//import 'package:tonic/tonic.dart';

List<Note> cTuning = [
  const Note(BaseNote.g),
  const Note(BaseNote.c),
  const Note(BaseNote.e),
  const Note(BaseNote.a)
];
List<Note> dTuning = [
  const Note(BaseNote.a),
  const Note(BaseNote.d),
  const Note(BaseNote.f, Accidental.sharp),
  const Note(BaseNote.b)
];
List<Note> gTuning = [
  const Note(BaseNote.d),
  const Note(BaseNote.g),
  const Note(BaseNote.b),
  const Note(BaseNote.e)
];
List<Note> aSharpTuning = [
  const Note(BaseNote.f),
  const Note(BaseNote.a, Accidental.sharp),
  const Note(BaseNote.d),
  const Note(BaseNote.g)
];
List<Note> slackKeyTuning = [
  const Note(BaseNote.g),
  const Note(BaseNote.c),
  const Note(BaseNote.e),
  const Note(BaseNote.g)
];
List<Note> slideTuning = [
  const Note(BaseNote.g),
  const Note(BaseNote.c),
  const Note(BaseNote.e),
  const Note(BaseNote.b, Accidental.sharp)
];
List<Note> lowGTuning = [
  const Note(BaseNote.g).transposeBy(-Interval.P8),
  const Note(BaseNote.c),
  const Note(BaseNote.e),
  const Note(BaseNote.a)
];
