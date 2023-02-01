class Isogram {
  bool isIsogram(String word) {
    final characters = Set<int>();
    for (var i = 0; i < word.length; i++) {
      final character = word[i].toLowerCase().codeUnitAt(0);
      if (characters.contains(character)) {
        return false;
      }
      characters.add(character);
    }
    return true;
  }
}
