class PascalsTriangle {
  List<List<int>> rows(int count) {
    if (count == 0) {
      return [];
    }

    List<List<int>> result = [];
    result.add([1]);
    for (int i = 1; i < count; i++) {
      List<int> row = [];
      row.add(1);
      for (int j = 1; j < i; j++) {
        row.add(result[i - 1][j - 1] + result[i - 1][j]);
      }
      row.add(1);
      result.add(row);
    }
    return result;
  }
}
