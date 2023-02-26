class Isogram {
  bool isIsogram(String word) {
    final characters = <String>{};
    for (var char in word.replaceAll(RegExp(r'[-\s]'), '').toLowerCase().split('')) {
      if (characters.contains(char)) {
        return false;
      }
      characters.add(char);
    }
    return true;
  }
}
