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
  
  @override
  Widget build(BuildContext context) {
  
    // set difficulty
    Difficulty difficulty = ModalRoute.of(context).settings.arguments;
    if (difficulty != null) {
      this.difficulty = difficulty;
    } else {
      this.difficulty = Difficulty.beginner;
    }
    
    print(this.difficulty);
    
    gameTimer.start(seconds: 5, callback: () {
      print("timer");
    });
    
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
