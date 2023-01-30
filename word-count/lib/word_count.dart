class WordCount {
  Map<String, int> countWords(String word) {
    Map<String, int> result = new Map();

    word.split(new RegExp(r"[^a-zA-Z0-9']+")).forEach((w) => 
      result.update(w.toLowerCase(), (i) => i + 1, ifAbsent: () => 1));
    return result;
  }
}
