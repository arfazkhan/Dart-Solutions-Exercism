class Forth {
  var stack = <int>[];
  var definitions = <String, List<String>>{};

  void arithmetic(String token) {
    if (stack.length < 2) {
      throw FormatException('Exception: Stack empty');
    }
    switch (token) {
      case '+':
        stack.add(stack.removeLast() + stack.removeLast());
        break;
      case '-':
        stack.add(stack.removeLast() - stack.removeLast());
        break;
      case '*':
        stack.add(stack.removeLast() * stack.removeLast());
        break;
      case '/':
        final divisor = stack.removeLast();
        if (divisor == 0) {
          throw FormatException("Division by zero");
        }
        stack.add(stack.removeLast() ~/ divisor);
        break;
      default:
        throw FormatException('Unknown operator: $token');
    }
  }

  void stackManipulation(String token) {
    switch (token.toLowerCase()) {
      case 'dup':
        if (stack.isEmpty) {
          throw FormatException('Stack empty');
        }
        stack.add(stack.last);
        break;
      case 'drop':
        if (stack.isEmpty) {
          throw FormatException('Stack empty');
        }
        stack.removeLast();
        break;
      case 'swap':
        if (stack.length < 2) {
          throw FormatException('Stack empty');
        } else {
          final first = stack.removeLast();
          final second = stack.removeLast();
          stack.addAll([first, second]);
        }
        break;
      case 'over':
        if (stack.length < 2) {
          throw FormatException('Stack empty');
        } else {
          stack.add(stack[stack.length - 2]);
        }
        break;
      default:
        throw FormatException('Unknown operator: $token');
    }
  }

  void makeDefinition(String token, List<String> definition) {
    if (definitions.containsKey(token)) {
      throw FormatException('Duplicate definition');
    } else {
      definitions[token] = definition;
    }
  }

  void evaluate(String input) {
    final tokens = input.split(' ');
    var isInDefinition = false;
    var definitionName = '';
    var definitionContent = <String>[];
    for (var token in tokens) {
      if (token == ':') {
        isInDefinition = true;
        continue;
      }
      if (token == ';') {
        isInDefinition = false;
        if (definitionName.isNotEmpty) {
          makeDefinition(definitionName, definitionContent);
        } else {
          throw FormatException('Invalid definition');
        }
        definitionName = '';
        definitionContent = [];
        continue;
      }
      if (isInDefinition && definitionName.isEmpty) {
        if (!token.isNumber()) {
          definitionName = token;
        } else {
          throw FormatException('Invalid definition');
        }
        continue;
      }
      if (isInDefinition && definitionName.isNotEmpty) {
      definitionContent.add(token);
      continue;
      }
      if (definitions.containsKey(token)) {
      evaluate(definitions[token]!.join(' '));
      continue;
      }
      if (token.isIntegerOperator()) {
      arithmetic(token);
      continue;
      }
      if (token.isStackManipulation()) {
      stackManipulation(token);
      continue;
      }
      if (token.isNumber()) {
      stack.add(int.parse(token));
      continue;
      }
    }
  }
}

extension on String {
bool isNumber() => int.tryParse(this) != null;
bool isStackManipulation() =>
['dup', 'drop', 'swap', 'over'].contains(this.toLowerCase());
bool isIntegerOperator() => ['+', '-', '*', '/'].contains(this);
bool isDefinitionStart() => this == ':';
bool isDefinitionEnd() => this == ';';
}

