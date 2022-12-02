import '../../shared/utils.dart';

void main(List<String> args) async {
  final input = await readInputFile("2-1.txt");
  final lineScores = getLineScores(input);

  partOne(lineScores);
}

void partOne(Iterable<int> lineScores) {
  final totalScore =
      lineScores.fold(0, (previousValue, element) => previousValue + element);

  print("The total score is: ${totalScore}");
}

Iterable<int> getLineScores(Iterable<String> input) {
  final List<int> lineScores = List.empty(growable: true);

  for (final line in input) {
    final splittedInput = line.split(" ");
    try {
      final opponent = _inputTranslation[splittedInput[0]];
      final me = _inputTranslation[splittedInput[1]];
      if (opponent == null || me == null) {
        throw new Exception("Input is null; Opponent: ${opponent}, Me: ${me}");
      }
      final score = calculateScore(opponent, me);
      lineScores.add(score);
    } catch (e) {
      print("Could not handle line: ${line}");
    }
  }

  return lineScores;
}

Map<String, GameInput> _inputTranslation = <String, GameInput>{
  "A": GameInput.Rock,
  "B": GameInput.Paper,
  "C": GameInput.Scissors,
  "X": GameInput.Rock,
  "Y": GameInput.Paper,
  "Z": GameInput.Scissors
};

enum GameInput { Rock, Paper, Scissors }

Map<GameInput, int> _shapeScore = {
  GameInput.Rock: 1,
  GameInput.Paper: 2,
  GameInput.Scissors: 3
};

int calculateScore(GameInput opponent, GameInput me) {
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


// Shape: 
// A, X Rock 1 
// B, Y Paper 2
// Z, Z Sciscor 3 

// Outcome
// Win 6
// Draw 3
// Lose 0 

