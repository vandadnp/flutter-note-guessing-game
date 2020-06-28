import 'package:flutter/material.dart';
import 'package:noteguessinggame/difficulty.dart';
import 'package:noteguessinggame/game_timer.dart';
import 'title_widget.dart';
import 'note.dart';

class GameScreen extends StatefulWidget {
  final Difficulty difficulty;

  const GameScreen({this.difficulty});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameTimer gameTimer = GameTimer();
  Note currentNote;

  void setupButtonsAndPlayRandomNote() {
    List<Widget> widgets = [
      Text(
        "🔊",
        style: TextStyle(fontSize: 50),
      ),
    ];

    currentNote = Note.randomNote();

    var noteTypesForButtons = currentNote.noteType
        .noteTypesExcludingThis(widget.difficulty.buttonsNeeded);

    var buttons = noteTypesForButtons
        .map((e) => AnswerButton(
            noteType: e,
            onPressed: (noteType) {
              processAnswer(noteType);
            }))
        .toList();

    // for every two buttons create a row
    for (var i = 0; i < buttons.length; i += 2) {
      var twoButtons = buttons.sublist(i, i + 2);
      var row = AnswerRow(buttons: twoButtons);
      widgets.add(row);
    }

    setState(() {
      columnChildren = widgets;
    });
  }

  @override
  void initState() {
    super.initState();

    gameTimer.start(
        seconds: 5,
        callback: () {
          if (!mounted) {
            return;
          }
          setupButtonsAndPlayRandomNote();
        });
  }

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
    return Scaffold(
      appBar: AppBar(title: TitleWidget()),
      body: Center(
        child: Column(children: columnChildren),
      ),
    );
  }
}

typedef AnswerCallback = void Function(NoteType noteType);

class AnswerRow extends StatelessWidget {
  final List<AnswerButton> buttons;

  const AnswerRow({this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons,
    );
  }
}

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
