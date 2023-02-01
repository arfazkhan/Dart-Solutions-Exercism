class Diamond {
  List<String> rows(String letter) {
    int n = letter.codeUnitAt(0) - 'A'.codeUnitAt(0) + 1;
    int m = 2 * n - 1;
    List<String> result = [];
    for (int i = 0; i < n; i++) {
      String row = '';
      for (int j = 0; j < m; j++) {
        if (j >= n - i - 1 && j <= n + i - 1) {
          row += (j == n - i - 1 || j == n + i - 1) ?
              String.fromCharCode('A'.codeUnitAt(0) + i) : ' ';
        } else {
          row += ' ';
        }
      }
      result.add(row);
    }
    result.addAll(result.reversed.skip(1));
    return result;
  }
}
