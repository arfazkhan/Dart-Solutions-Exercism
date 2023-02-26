class Allergies {
  static const allergens = [
    'eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'
  ];

  bool allergicTo(String allergen, int score) {
    return score & (1 << allergens.indexOf(allergen)) != 0;
  }

  List<String> list(int score) {
    return allergens.where((allergen) => allergicTo(allergen, score)).toList();
  }
}
