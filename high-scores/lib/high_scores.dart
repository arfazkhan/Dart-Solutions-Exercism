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
    final sortedScores = _scores.toList()..sort((a, b) => b.compareTo(a));
    final topScores = <int>[];
    var i = 0;
    while (i < sortedScores.length && topScores.length < 3) {
      final score = sortedScores[i];
      final count = sortedScores.sublist(i).takeWhile((s) => s == score).length;
      topScores.addAll(List.generate(min(3 - topScores.length, count), (_) => score));
      i += count;
    }
    return topScores;
  }
}
