import 'game_screen.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';

enum Screen {
	splash,
	game
}

extension Routes on Screen {
	String get id {
		switch (this) {
			case Screen.splash: return "splash";
			case Screen.game: return "game";
			default: return  "";
		}
	}
	
	Widget get instance {
		switch (this) {
			case Screen.splash: return SplashScreen();
			case Screen.game: return GameScreen();
			default: return null;
		}
	}
}