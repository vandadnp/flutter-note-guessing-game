import 'package:assets_audio_player/assets_audio_player.dart';

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

extension Name on NoteType {
  String get name => const {
        NoteType.a: "A",
        NoteType.aSharp: "A#",
        NoteType.b: "B",
        NoteType.c: "C",
        NoteType.cSharp: "C#",
        NoteType.d: "D",
        NoteType.dSharp: "D#",
        NoteType.e: "E",
        NoteType.f: "F",
        NoteType.fSharp: "F#",
        NoteType.g: "G",
        NoteType.gSharp: "G#",
      }[this];
}

class Note {
  final String fileName;
  final String name;
  final NoteType noteType;

  void play() {
    _player.stop();
    _player.open(
      Audio(path()),
      autoStart: true,
      showNotification: false,
    );
  }

  static String dir = "assets/audios";

  String path() => "$dir/$fileName";

  const Note({
    this.name,
    this.fileName,
    this.noteType,
  });
}

const notes = [];
