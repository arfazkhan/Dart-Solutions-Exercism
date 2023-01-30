class SumOfMultiples {
  int sum(List<int> multiples, int n) {
    final filteredMultiples = multiples.where((m) => m != 0);
    return Iterable<int>.generate(n, (i) => i)
        .where((i) => filteredMultiples.any((m) => i % m == 0))
        .reduce((a, b) => a + b);
  }
}
