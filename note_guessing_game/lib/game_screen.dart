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
  var correctAnswers = 0;
  var wrongAnswers = 0;

  void setupButtonsAndPlayRandomNote() {
    List<Widget> widgets = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                Text(": ${wrongAnswers.toString()}"),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_box, color: Colors.green.shade400),
                Text(": ${correctAnswers.toString()}"),
              ],
            )
          ],
        ),
      ),
      Spacer(
        flex: 1,
      ),
      Icon(
        Icons.music_note,
        size: 200,
        color: Colors.blue.shade100,
      ),
      Spacer(
        flex: 1,
      )
    ];

    if (currentNote != null) {
      currentNote.stop();
    }

    currentNote = Note.randomNote();

    var noteTypesForButtons = currentNote.noteType
        .noteTypesExcludingThis(widget.difficulty.buttonsNeeded - 1);

    noteTypesForButtons.add(currentNote.noteType);
    noteTypesForButtons.shuffle();

    var buttons = noteTypesForButtons
        .map((e) => AnswerButton(
            noteType: e,
            onPressed: (noteType) async {
              await processAnswer(noteType);
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

    currentNote.play();
  }

  void setupTimer() {
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
  void initState() {
    super.initState();
    setupTimer();
  }

  @override
  void dispose() {
    gameTimer.stop();
    Note.stopPlayer();
    super.dispose();
  }

  List<Widget> columnChildren = [];

  Future<void> processAnswer(NoteType noteType) async {
    gameTimer.stop();

    String answerText;
    Icon answerIcon;
    if (currentNote.noteType == noteType) {
      correctAnswers += 1;
      // correct answer
      answerIcon = Icon(
        Icons.check_box,
        color: Colors.green.shade400,
        size: 200.0,
      );
      answerText = "That's correct!";
    } else {
      // wrong answer
      wrongAnswers += 1;
      answerIcon = Icon(
        Icons.clear,
        color: Colors.red,
        size: 200.0,
      );
      answerText = "Correct answer: ${currentNote.noteType.name}";
    }

    List<Widget> widgets = [
      Spacer(
        flex: 1,
      ),
      answerIcon,
      Text(
        answerText,
        style: TextStyle(fontSize: 30.0),
      ),
      Spacer(
        flex: 1,
      )
    ];
    
    setState(() {
      columnChildren = widgets;
    });

    Future.delayed(Duration(seconds: 2), () {
      setupTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleWidget()),
      body: SafeArea(
        child: Center(
          child: Column(
            children: columnChildren,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
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
      mainAxisAlignment: MainAxisAlignment.center,
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
    return SizedBox(
      width: 160.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RaisedButton(
          child: Text(
            noteType.name,
            style: TextStyle(fontSize: 70.0),
          ),
          onPressed: () {
            onPressed(noteType);
          },
        ),
      ),
    );
  }
}
