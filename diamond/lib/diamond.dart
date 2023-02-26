class Diamond {
  List<String> rows(String letter) {
    final int n = letter.codeUnitAt(0) - 'A'.codeUnitAt(0) + 1;
    final int m = 2 * n - 1;
    final List<String> result = [];

    if (n == 1) {
      result.add('A');
      return result;
    }

    // Top half of diamond
    for (int i = 0; i < n; i++) {
      final List<String> rowList = List.filled(m, ' ');
      rowList[n - i - 1] = String.fromCharCode('A'.codeUnitAt(0) + i);
      rowList[n + i - 1] = String.fromCharCode('A'.codeUnitAt(0) + i);
      final String row = rowList.join('');
      result.add(row);
    }

    // Bottom half of diamond
    for (int i = n - 2; i >= 0; i--) {
      final List<String> rowList = List.filled(m, ' ');
      rowList[n - i - 1] = String.fromCharCode('A'.codeUnitAt(0) + i);
      rowList[n + i - 1] = String.fromCharCode('A'.codeUnitAt(0) + i);
      final String row = rowList.join('');
      result.add(row);
    }

    return result;
  }
}
