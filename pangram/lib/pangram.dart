class Pangram {
 bool isPangram(String sentence) {
  Set<String> letters = Set.from(sentence.toLowerCase().split(""));
  letters.removeWhere((e) => e == " ");
  return letters.length == 26;
}
}
