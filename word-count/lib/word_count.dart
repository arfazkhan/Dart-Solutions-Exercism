class WordCount {
  Map<String, int> countWords(String s) {
    final regExp = RegExp(r"[a-z]+'[a-z]+|[a-z]+|[0-9]+");
    var words = <String, int>{};
    for (final m in regExp.allMatches(s.toLowerCase())) {
      words.update(m[0] ?? "", (value) => value + 1, ifAbsent: () => 1);
    }
    return words;
  }
}