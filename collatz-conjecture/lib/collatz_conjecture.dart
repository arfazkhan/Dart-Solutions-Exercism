class CollatzConjecture {
  int steps(int n) {
    if (n <= 0) {
      throw ArgumentError("Only positive integers are allowed");
    }
    int c = 0;
    while (n != 1) {
      n = n % 2 == 0 ? n ~/ 2 : 3 * n + 1;
      c++;
    }
    return c;
  }
}
