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