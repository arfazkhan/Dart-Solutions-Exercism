class Hamming {
  int distance(String s1, String s2) {
    if (s1.length != s2.length) {
      throw ArgumentError("strands must be of equal length");
    }
    int hammingDistance = 0;
    for (int i = 0; i < s1.length; i++) {
      if (s1[i] != s2[i]) {
        hammingDistance++;
      }
    }
    return hammingDistance;
  }
}
