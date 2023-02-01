class Acronym {
  String abbreviate(String phrase) {
    List<String> words = phrase.split(RegExp(r'[\s\W]+'));
    String acronym = "";
    for (String word in words) {
      acronym += word[0].toUpperCase();
    }
    return acronym;
  }
}