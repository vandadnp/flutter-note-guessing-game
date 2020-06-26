import 'package:flutter/material.dart';
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
  
  @override
  void dispose() {
    gameTimer.stop();
    Note.stopPlayer();
    super.dispose();
  }
  
  @override
  void initState() {
    gameTimer.start(seconds: 5, callback: () {
      print("timer");
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleWidget()
      ),
      body: Column(
        children: <Widget>[
        
        ],
      ),
    );
  }
}
