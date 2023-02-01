class Allergies {
  static final allergens = ['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'];

  List<String> list(int score) {
    final result = <String>[];
    for (var i = allergens.length - 1; i >= 0; i--) {
      if (score >= (1 << i)) {
        result.add(allergens[i]);
        score -= (1 << i);
      }
    }
    return result;
  }

  bool allergicTo(String allergen, int score) {
    final index = allergens.indexOf(allergen);
    return index != -1 && score & (1 << index) != 0;
  }
}
