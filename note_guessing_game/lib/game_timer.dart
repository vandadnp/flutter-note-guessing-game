import 'package:flutter/material.dart';
import 'dart:async';

typedef Ticker = void Function(int);

class GameTimer {
  
  Timer _timer;

  void start({
    int seconds,
    VoidCallback callback,
  }) {
    callback();
    _timer = Timer.periodic(Duration(seconds: seconds), (timer) {
      callback();
    });
  }
  
  void stop() {
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
