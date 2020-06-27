enum Difficulty {
  beginner,
  intermediate,
  expert,
}

extension Name on Difficulty {
  String get name {
    switch (this) {
      case Difficulty.beginner:
        return "Beginner";
      case Difficulty.intermediate:
        return "Intermediate";
      case Difficulty.expert:
        return "Expert";
      default:
        return "";
    }
  }
}

extension Buttons on Difficulty {
  int get buttonsNeeded {
    switch (this) {
      case Difficulty.beginner: return 2;
      case Difficulty.intermediate: return 4;
      case Difficulty.expert: return 6;
      default: return 0;
    }
  }
}