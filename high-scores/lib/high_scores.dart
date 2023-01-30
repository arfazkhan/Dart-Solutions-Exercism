import 'dart:math';
class HighScores {
  final List<int> _scores;

  HighScores(List<int> scores) : _scores = List.of(scores);

  List<int> get scores => List.of(_scores);

  int latest() {
    return _scores.last;
  }

  int personalBest() {
    return _scores.reduce(max);
  }

  List<int> personalTopThree() {
    final topThree = _scores.toSet().toList();
    topThree.sort((a, b) => b.compareTo(a));
    return topThree.sublist(0, min(3, topThree.length));
  }

}