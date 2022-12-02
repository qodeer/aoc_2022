import 'game_input.dart';

class Game {
  final GameInput opponent;
  final GameInput me;
  Game({
    required this.opponent,
    required this.me,
  });

  Game copyWith({
    GameInput? opponent,
    GameInput? me,
  }) {
    return Game(
      opponent: opponent ?? this.opponent,
      me: me ?? this.me,
    );
  }

  Map<GameInput, int> _shapeScore = {
    GameInput.Rock: 1,
    GameInput.Paper: 2,
    GameInput.Scissors: 3
  };

  int get gameResult {
    int score = _shapeScore[me] ?? 0;

    if (opponent == me) {
      // Draw
      score += 3;
    } else if (me == GameInput.Rock && opponent == GameInput.Scissors) {
      score += 6;
    } else if (me == GameInput.Scissors && opponent == GameInput.Paper) {
      score += 6;
    } else if (me == GameInput.Paper && opponent == GameInput.Rock) {
      score += 6;
    }

    return score;
  }
}
