import 'package:flutter/material.dart';
import 'title_widget.dart';
import 'screens.dart';
import 'difficulty.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: TitleWidget(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Choose difficulty!",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            DifficultyButton.beginner(),
            DifficultyButton.intermediate(),
            DifficultyButton.expert(),
          ],
        ),
      ),
    );
  }
}

class DifficultyButton extends StatelessWidget {
  final Difficulty difficulty;

  const DifficultyButton({
    this.difficulty,
  });

  static DifficultyButton beginner() =>
      DifficultyButton(difficulty: Difficulty.beginner);

  static DifficultyButton intermediate() =>
      DifficultyButton(difficulty: Difficulty.intermediate);

  static DifficultyButton expert() =>
      DifficultyButton(difficulty: Difficulty.expert);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 250.0,
        child: RaisedButton(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              difficulty.name,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          onPressed: () {
            Screen.game.push(
                context,
                RouteSettings(
                  arguments: difficulty,
                ));
          },
        ),
      ),
    );
  }
}
