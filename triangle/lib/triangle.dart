class Triangle {
  bool equilateral(num a, num b, num c) => a == b && b == c && a > 0;
  bool isosceles(num a, num b, num c) => a >= b && a >= c ? a == b || a == c : b >= a && b >= c ? b == a || b == c : c == a || c == b;
  bool scalene(num a, num b, num c) => a != b && b != c && c != a && a + b > c && b + c > a && c + a > b;
}
