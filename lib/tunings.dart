import 'package:music_notes/music_notes.dart';

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
List<Note> lowGTuning = [
  Note.parse('G3'),
  const Note(BaseNote.c),
  const Note(BaseNote.e),
  const Note(BaseNote.a)
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
