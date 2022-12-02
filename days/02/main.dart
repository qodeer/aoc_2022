import '../../shared/utils.dart';
import 'game.dart';
import 'game_input.dart';
import 'game_reusult.dart';

void main(List<String> args) async {
  final input = await readInputFile("2-1.txt");

  partOne(input);
  partTwo(input);
}

void partOne(Iterable<String> input) {
  final games = _getPartOneGames(input);
  final totalScore = _getTotalScore(games);

  print("P1: The total score is: ${totalScore}");
}

void partTwo(Iterable<String> input) {
  final games = _getPartTwoGames(input);
  final totalScore = _getTotalScore(games);

  print("P2: The total score is: ${totalScore}");
}

int _getTotalScore(Iterable<Game> gameResult) {
  return gameResult.fold(
      0, (previousValue, element) => previousValue + element.gameResult);
}

Iterable<Game> _getPartOneGames(Iterable<String> input) {
  Map<String, GameInput> _inputTranslation = <String, GameInput>{
    "A": GameInput.Rock,
    "B": GameInput.Paper,
    "C": GameInput.Scissors,
    "X": GameInput.Rock,
    "Y": GameInput.Paper,
    "Z": GameInput.Scissors
  };

  final List<Game> games = List.empty(growable: true);

  for (final line in input) {
    final splittedInput = line.split(" ");
    try {
      final opponent = _inputTranslation[splittedInput[0]];
      final me = _inputTranslation[splittedInput[1]];
      if (opponent == null || me == null) {
        throw new Exception("Input is null; Opponent: ${opponent}, Me: ${me}");
      }
      final game = new Game(opponent: opponent, me: me);
      games.add(game);
    } catch (e) {
      print("Could not handle line: ${line}");
    }
  }

  return games;
}

Iterable<Game> _getPartTwoGames(Iterable<String> input) {
  Map<String, GameInput> _inputTranslation = <String, GameInput>{
    "A": GameInput.Rock,
    "B": GameInput.Paper,
    "C": GameInput.Scissors,
  };

  Map<String, GameResult> _resultTranslation = <String, GameResult>{
    "X": GameResult.Lose,
    "Y": GameResult.Draw,
    "Z": GameResult.Win,
  };

  final List<Game> games = List.empty(growable: true);

  for (final line in input) {
    final splittedInput = line.split(" ");
    try {
      final opponent = _inputTranslation[splittedInput[0]];
      final epxectedResult = _resultTranslation[splittedInput[1]];
      if (opponent == null || epxectedResult == null) {
        throw new Exception(
            "Input is null; Opponent: ${opponent}, expectedResult: ${epxectedResult}");
      }
      final me = _getExpectedGameInput(opponent, epxectedResult);
      final game = new Game(opponent: opponent, me: me);
      games.add(game);
    } catch (e) {
      print("Could not handle line: ${line}");
    }
  }

  return games;
}

GameInput _getExpectedGameInput(GameInput input, GameResult result) {
  if (result == GameResult.Draw) {
    return input;
  } else if (input == GameInput.Rock) {
    return result == GameResult.Win ? GameInput.Paper : GameInput.Scissors;
  } else if (input == GameInput.Paper) {
    return result == GameResult.Win ? GameInput.Scissors : GameInput.Rock;
  } else {
    return result == GameResult.Win ? GameInput.Rock : GameInput.Paper;
  }
}
