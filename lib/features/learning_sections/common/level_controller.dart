enum Level {
  beginner,
  intermediate,
  advanced,
}

class LevelController {
  static Level level = Level.beginner;

  static setLevel(Level currentLevel) => level = currentLevel;
}