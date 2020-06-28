import 'dart:ffi';

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

  void processAnswer(NoteType noteType) {}

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

          currentNote = Note.randomNote();

          var noteTypesForButtons = currentNote.noteType
              .noteTypesExcludingThis(difficulty.buttonsNeeded);

          var buttons = noteTypesForButtons
              .map((e) => AnswerButton(
                  noteType: e,
                  onPressed: (noteType) {
                    processAnswer(noteType);
                  }));
          
          // for every two buttons create a row
          

          widgets.addAll(buttons);

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

typedef AnswerCallback = void Function(NoteType noteType);

class AnswerButton extends StatelessWidget {
  final NoteType noteType;
  final AnswerCallback onPressed;

  const AnswerButton({
    this.noteType,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(noteType.name),
      onPressed: () {
        onPressed(noteType);
      },
    );
  }
}
