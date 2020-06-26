import 'package:flutter/material.dart';
import 'title_widget.dart';
import 'screens.dart';
import 'note.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: TitleWidget(),
      ),
      body: Center(
        child: RaisedButton(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "READY?",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, Screen.game.id);
          },
        ),
      ),
    );
  }
}