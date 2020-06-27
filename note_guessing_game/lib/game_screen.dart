import 'package:flutter/material.dart';
import 'package:noteguessinggame/difficulty.dart';
import 'package:noteguessinggame/game_timer.dart';
import 'title_widget.dart';
import 'note.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameTimer gameTimer = GameTimer();
  Note currentNote;
  Difficulty difficulty;

  @override
  void dispose() {
    gameTimer.stop();
    Note.stopPlayer();
    super.dispose();
  }

  List<Widget> columnChildren = [];

  @override
  Widget build(BuildContext context) {
    // set difficulty
    Difficulty difficulty = ModalRoute.of(context).settings.arguments;
    if (difficulty != null) {
      this.difficulty = difficulty;
    } else {
      this.difficulty = Difficulty.beginner;
    }

    gameTimer.start(
        seconds: 5,
        callback: () {
          List<Widget> widgets = [
            Text(
              "🔊",
              style: TextStyle(fontSize: 50),
            ),
          ];
          
//          List<int>.generate(difficulty.buttonsNeeded, (index) => null)

          setState(() {
            columnChildren = widgets;
          });
        });

    return Scaffold(
      appBar: AppBar(title: TitleWidget()),
      body: Column(children: columnChildren),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final NoteType noteType;
  final VoidCallback onPressed;

  const AnswerButton({
    this.noteType,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(noteType.name),
      onPressed: onPressed,
    );
  }
}
