class NthPrime {
  int prime(int n) {
    if (n <= 0) throw ArgumentError('Invalid: There is no zeroth prime');
    var primes = [2];
    var i = 3;
    while (primes.length < n) {
      var isPrime = true;
      var maxFactor = (i / 2).ceil();
      for (var j = 2; j <= maxFactor; j++) {
        if (i % j == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) primes.add(i);
      i++;
    }
    return primes.last;
  }
}
