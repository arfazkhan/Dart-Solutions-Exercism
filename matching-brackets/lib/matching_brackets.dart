class MatchingBrackets {
  final Map<String, String> brackets = {'(': ')', '{': '}', '[': ']'};

  bool isPaired(String s) {
    final stack = <String>[];

    for (final char in s.split('')) {
      if (brackets.containsKey(char)) {
        stack.add(char);
      } else if (brackets.containsValue(char)) {
        if (stack.isEmpty || brackets[stack.last] != char) {
          return false;
        }
        stack.removeLast();
      }
    }
    return stack.isEmpty;
  }
}
