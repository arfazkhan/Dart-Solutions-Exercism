class Darts {
  int score(double x, double y) {
    final distance = x * x + y * y;
    if (distance <= 1) {
      return 10;
    } else if (distance <= 25) {
      return 5;
    } else if (distance <= 100) {
      return 1;
    } else {
      return 0;
    }
  }
}
