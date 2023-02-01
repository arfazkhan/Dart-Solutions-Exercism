class BeerSong {
  List<String> recite(int n, int count) {
    final result = <String>[];
    for (var i = n; i >= n - count + 1; i--) {
      result.add('$i bottles of beer on the wall, $i bottles of beer.');
      if (i > 1) {
        result.add('Take one down and pass it around, ${i - 1} bottles of beer on the wall.');
      } 
    }
    return result;
  }
}
