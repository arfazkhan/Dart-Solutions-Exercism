class NthPrime {
  int prime(int n) {
    if (n <= 0) throw ArgumentError('There is no zeroth prime');
    var primes = [2];
    for (var i = 3; primes.length < n; i += 2) {
      if (primes.every((p) => i % p != 0)) primes.add(i);
    }
    return primes.last;
  }
}
