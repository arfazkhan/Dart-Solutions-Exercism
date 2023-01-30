class ResistorColorDuo {
  int value(List<String> colors) {
    final colorMap = {
      'black': 0,
      'brown': 1,
      'red': 2,
      'orange': 3,
      'yellow': 4,
      'green': 5,
      'blue': 6,
      'violet': 7,
      'grey': 8,
      'white': 9,
    };

    return int.parse('${colorMap[colors[0]]}${colorMap[colors[1]]}');
  }
}
