import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text(
          "🎸",
          style: TextStyle(
            fontSize: 45.0,
          ),
        ),
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
          onPressed: () {},
        ),
      ),
    );
  }
}
