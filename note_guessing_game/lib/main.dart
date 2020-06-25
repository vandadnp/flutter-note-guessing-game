import 'package:flutter/material.dart';
import 'screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '🎸',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        Screen.splash.id: (context) => Screen.splash.instance,
        Screen.game.id: (context) => Screen.game.instance,
      },
      initialRoute: Screen.splash.id,
    );
  }
}

