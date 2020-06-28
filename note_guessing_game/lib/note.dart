import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:math';

var _player = AssetsAudioPlayer.newPlayer();

enum NoteType {
  a,
  aSharp,
  b,
  c,
  cSharp,
  d,
  dSharp,
  e,
  f,
  fSharp,
  g,
  gSharp,
}

const List<NoteType> _allNotes = [
  NoteType.a,
  NoteType.aSharp,
  NoteType.b,
  NoteType.c,
  NoteType.cSharp,
  NoteType.d,
  NoteType.dSharp,
  NoteType.e,
  NoteType.f,
  NoteType.fSharp,
  NoteType.g,
  NoteType.gSharp
];

extension Shuffle on List {
  List shuffled() {
    var thisShuffled = this;
    thisShuffled.shuffle();
    return thisShuffled;
  }
}

extension Name on NoteType {
  List<NoteType> noteTypesExcludingThis(int count) => _allNotes
      .where((element) => element != this)
      .take(count)
      .toList();

  String get name {
    switch (this) {
      case NoteType.a:
        return "A";
      case NoteType.aSharp:
        return "A#";
      case NoteType.b:
        return "B";
      case NoteType.c:
        return "C";
      case NoteType.cSharp:
        return "C#";
      case NoteType.d:
        return "D";
      case NoteType.dSharp:
        return "D#";
      case NoteType.e:
        return "E";
      case NoteType.f:
        return "F";
      case NoteType.fSharp:
        return "F#";
      case NoteType.g:
        return "G";
      case NoteType.gSharp:
        return "G#";
      default:
        return "";
    }
  }
}

class Note {
  final String fileName;
  final NoteType noteType;

  static Random _rnd = Random();
  static Note randomNote() => notes[_rnd.nextInt(notes.length)];

  void play() {
    _player.stop();
    _player.open(
      Audio(path()),
      autoStart: true,
      showNotification: false,
    );
  }
  
  void stop() {
    _player.stop();
  }

  static String dir = "assets/audios";

  String path() => "$dir/$fileName";

  const Note({
    this.fileName,
    this.noteType,
  });

  static void stopPlayer() {
    _player.stop();
  }
}

const notes = [
  Note(
    fileName: "clean-A-1.wav",
    noteType: NoteType.a,
  ),
  Note(
    fileName: "clean-A-2.wav",
    noteType: NoteType.a,
  ),
  Note(
    fileName: "clean-A-3.wav",
    noteType: NoteType.a,
  ),
  Note(
    fileName: "clean-A-4.wav",
    noteType: NoteType.a,
  ),
  Note(
    fileName: "clean-A-5.wav",
    noteType: NoteType.a,
  ),
  Note(
    fileName: "clean-A-6.wav",
    noteType: NoteType.a,
  ),
  Note(
    fileName: "clean-A-7.wav",
    noteType: NoteType.a,
  ),
  Note(
    fileName: "clean-A#-1.wav",
    noteType: NoteType.aSharp,
  ),
  Note(
    fileName: "clean-A#-2.wav",
    noteType: NoteType.aSharp,
  ),
  Note(
    fileName: "clean-A#-3.wav",
    noteType: NoteType.aSharp,
  ),
  Note(
    fileName: "clean-A#-4.wav",
    noteType: NoteType.aSharp,
  ),
  Note(
    fileName: "clean-A#-5.wav",
    noteType: NoteType.aSharp,
  ),
  Note(
    fileName: "clean-A#-6.wav",
    noteType: NoteType.aSharp,
  ),
  Note(
    fileName: "clean-A#-7.wav",
    noteType: NoteType.aSharp,
  ),
  Note(
    fileName: "clean-B-1.wav",
    noteType: NoteType.b,
  ),
  Note(
    fileName: "clean-B-2.wav",
    noteType: NoteType.b,
  ),
  Note(
    fileName: "clean-B-3.wav",
    noteType: NoteType.b,
  ),
  Note(
    fileName: "clean-B-4.wav",
    noteType: NoteType.b,
  ),
  Note(
    fileName: "clean-B-5.wav",
    noteType: NoteType.b,
  ),
  Note(
    fileName: "clean-B-6.wav",
    noteType: NoteType.b,
  ),
  Note(
    fileName: "clean-B-7.wav",
    noteType: NoteType.b,
  ),
  Note(
    fileName: "clean-C-1.wav",
    noteType: NoteType.c,
  ),
  Note(
    fileName: "clean-C-2.wav",
    noteType: NoteType.c,
  ),
  Note(
    fileName: "clean-C-3.wav",
    noteType: NoteType.c,
  ),
  Note(
    fileName: "clean-C-4.wav",
    noteType: NoteType.c,
  ),
  Note(
    fileName: "clean-C-5.wav",
    noteType: NoteType.c,
  ),
  Note(
    fileName: "clean-C-6.wav",
    noteType: NoteType.c,
  ),
  Note(
    fileName: "clean-C-7.wav",
    noteType: NoteType.c,
  ),
  Note(
    fileName: "clean-C#-1.wav",
    noteType: NoteType.cSharp,
  ),
  Note(
    fileName: "clean-C#-2.wav",
    noteType: NoteType.cSharp,
  ),
  Note(
    fileName: "clean-C#-3.wav",
    noteType: NoteType.cSharp,
  ),
  Note(
    fileName: "clean-C#-4.wav",
    noteType: NoteType.cSharp,
  ),
  Note(
    fileName: "clean-C#-5.wav",
    noteType: NoteType.cSharp,
  ),
  Note(
    fileName: "clean-C#-6.wav",
    noteType: NoteType.cSharp,
  ),
  Note(
    fileName: "clean-C#-7.wav",
    noteType: NoteType.cSharp,
  ),
  Note(
    fileName: "clean-D-1.wav",
    noteType: NoteType.d,
  ),
  Note(
    fileName: "clean-D-2.wav",
    noteType: NoteType.d,
  ),
  Note(
    fileName: "clean-D-3.wav",
    noteType: NoteType.d,
  ),
  Note(
    fileName: "clean-D-4.wav",
    noteType: NoteType.d,
  ),
  Note(
    fileName: "clean-D-5.wav",
    noteType: NoteType.d,
  ),
  Note(
    fileName: "clean-D-6.wav",
    noteType: NoteType.d,
  ),
  Note(
    fileName: "clean-D-7.wav",
    noteType: NoteType.d,
  ),
  Note(
    fileName: "clean-D#-1.wav",
    noteType: NoteType.dSharp,
  ),
  Note(
    fileName: "clean-D#-2.wav",
    noteType: NoteType.dSharp,
  ),
  Note(
    fileName: "clean-D#-3.wav",
    noteType: NoteType.dSharp,
  ),
  Note(
    fileName: "clean-D#-4.wav",
    noteType: NoteType.dSharp,
  ),
  Note(
    fileName: "clean-D#-5.wav",
    noteType: NoteType.dSharp,
  ),
  Note(
    fileName: "clean-D#-6.wav",
    noteType: NoteType.dSharp,
  ),
  Note(
    fileName: "clean-D#-7.wav",
    noteType: NoteType.dSharp,
  ),
  Note(
    fileName: "clean-E-1.wav",
    noteType: NoteType.e,
  ),
  Note(
    fileName: "clean-E-2.wav",
    noteType: NoteType.e,
  ),
  Note(
    fileName: "clean-E-3.wav",
    noteType: NoteType.e,
  ),
  Note(
    fileName: "clean-E-4.wav",
    noteType: NoteType.e,
  ),
  Note(
    fileName: "clean-E-5.wav",
    noteType: NoteType.e,
  ),
  Note(
    fileName: "clean-E-6.wav",
    noteType: NoteType.e,
  ),
  Note(
    fileName: "clean-E-7.wav",
    noteType: NoteType.e,
  ),
  Note(
    fileName: "clean-F-1.wav",
    noteType: NoteType.f,
  ),
  Note(
    fileName: "clean-F-2.wav",
    noteType: NoteType.f,
  ),
  Note(
    fileName: "clean-F-3.wav",
    noteType: NoteType.f,
  ),
  Note(
    fileName: "clean-F-4.wav",
    noteType: NoteType.f,
  ),
  Note(
    fileName: "clean-F-5.wav",
    noteType: NoteType.f,
  ),
  Note(
    fileName: "clean-F-6.wav",
    noteType: NoteType.f,
  ),
  Note(
    fileName: "clean-F-7.wav",
    noteType: NoteType.f,
  ),
  Note(
    fileName: "clean-F#-1.wav",
    noteType: NoteType.fSharp,
  ),
  Note(
    fileName: "clean-F#-2.wav",
    noteType: NoteType.fSharp,
  ),
  Note(
    fileName: "clean-F#-3.wav",
    noteType: NoteType.fSharp,
  ),
  Note(
    fileName: "clean-F#-4.wav",
    noteType: NoteType.fSharp,
  ),
  Note(
    fileName: "clean-F#-5.wav",
    noteType: NoteType.fSharp,
  ),
  Note(
    fileName: "clean-F#-6.wav",
    noteType: NoteType.fSharp,
  ),
  Note(
    fileName: "clean-F#-7.wav",
    noteType: NoteType.fSharp,
  ),
  Note(
    fileName: "clean-G-1.wav",
    noteType: NoteType.g,
  ),
  Note(
    fileName: "clean-G-2.wav",
    noteType: NoteType.g,
  ),
  Note(
    fileName: "clean-G-3.wav",
    noteType: NoteType.g,
  ),
  Note(
    fileName: "clean-G-4.wav",
    noteType: NoteType.g,
  ),
  Note(
    fileName: "clean-G-5.wav",
    noteType: NoteType.g,
  ),
  Note(
    fileName: "clean-G-6.wav",
    noteType: NoteType.g,
  ),
  Note(
    fileName: "clean-G-7.wav",
    noteType: NoteType.g,
  ),
  Note(
    fileName: "clean-G#-1.wav",
    noteType: NoteType.gSharp,
  ),
  Note(
    fileName: "clean-G#-2.wav",
    noteType: NoteType.gSharp,
  ),
  Note(
    fileName: "clean-G#-3.wav",
    noteType: NoteType.gSharp,
  ),
  Note(
    fileName: "clean-G#-4.wav",
    noteType: NoteType.gSharp,
  ),
  Note(
    fileName: "clean-G#-5.wav",
    noteType: NoteType.gSharp,
  ),
  Note(
    fileName: "clean-G#-6.wav",
    noteType: NoteType.gSharp,
  ),
  Note(
    fileName: "clean-G#-7.wav",
    noteType: NoteType.gSharp,
  ),
];
