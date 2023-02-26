class Pangram {
  bool isPangram(String sentence) {
    Set<String> letters = Set.from(sentence.replaceAll(RegExp(r'[^a-zA-Z]'), '').toLowerCase().split(""));
    return letters.length == 26;
  }
}
