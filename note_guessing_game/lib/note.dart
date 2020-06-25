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
   String get name {
      switch (this) {
          case NoteType.a: return "A";
          case NoteType.aSharp: return "A#";
          case NoteType.b: return "B";
          case NoteType.c: return "C";
          case NoteType.cSharp: return "C#";
          case NoteType.d: return "D";
          case NoteType.dSharp: return "D#";
          case NoteType.e: return "E";
          case NoteType.f: return "F";
          case NoteType.fSharp: return "F#";
          case NoteType.g: return "G";
          case NoteType.gSharp: return "G#";
          default: return "";
      }
  }
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
