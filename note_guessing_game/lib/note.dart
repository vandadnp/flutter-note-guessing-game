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

const notes = [
  
];
