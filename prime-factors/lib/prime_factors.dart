class PrimeFactors {
  List<int> factors(int number) {
    List<int> factors = [];
    for (int i = 2; i <= number; i++) {
      while (number % i == 0) {
        factors.add(i);
        number = number ~/ i;
      }
    }
    return factors;
  }
}
