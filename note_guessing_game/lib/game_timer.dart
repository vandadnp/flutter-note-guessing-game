import 'package:flutter/material.dart';
import 'dart:async';

class GameTimer {
  
  Timer _timer;

  void start({
    int seconds,
    VoidCallback callback,
  }) {
    callback();
    _timer = Timer.periodic(Duration(seconds: seconds), (timer) {
      if (timer.isActive) {
        callback();
      }
    });
  }
  
  void stop() {
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
