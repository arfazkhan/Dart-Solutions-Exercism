class SumOfMultiples {
  int sum(List<int> multiples, int n) {
    final uniqueMultiples = multiples.toSet().where((m) => m != 0);
    return Iterable<int>.generate(n)
        .where((i) => uniqueMultiples.any((m) => i % m == 0))
        .fold(0, (a, b) => a + b);
  }
}
