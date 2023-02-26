class Forth {
  late List<int> stack;
  late Map<String, String> definitions;
  Forth() {
    this.stack = [];
    this.definitions = {};
  }
  void evaluate(String input) {
    input = input.toLowerCase();
    var inputs = input.split(" ");
    if (RegExp(r'^:.+;$').hasMatch(input)) {
      if (int.tryParse(inputs[1]) != null)
        throw Exception("Invalid definition");
      var newDefinition = inputs.sublist(2, inputs.length - 1).join(" ");
      definitions.entries.forEach((element) {
        newDefinition = newDefinition.replaceAll(element.key, element.value);
      });
      this.definitions[inputs[1]] = newDefinition;
      return;
    }
    definitions.entries.forEach((element) {
      input = input.replaceAll(element.key, element.value);
    });
    inputs = input.split(" ");
    for (String i in inputs) {
      if (int.tryParse(i) != null) {
        this.stack.add(int.parse(i));
        continue;
      }
      if ("+-*/".contains(i)) {
        if (this.stack.length < 2) throw Exception("Stack empty");
        if (i == "/" && this.stack[this.stack.length - 1] == 0)
          throw Exception("Division by zero");
        var value = 0;
        switch (i) {
          case "+":
            value = this.stack[this.stack.length - 2] +
                this.stack[this.stack.length - 1];
            break;
          case "-":
            value = this.stack[this.stack.length - 2] -
                this.stack[this.stack.length - 1];
            break;
          case "*":
            value = this.stack[this.stack.length - 2] *
                this.stack[this.stack.length - 1];
            break;
          case "/":
            value = this.stack[this.stack.length - 2] ~/
                this.stack[this.stack.length - 1];
            break;
        }
        this.stack[this.stack.length - 2] = value;
        this.stack.removeLast();
        continue;
      }
      if (i == "dup") {
        if (this.stack.length == 0) throw Exception("Stack empty");
        this.stack.add(this.stack[this.stack.length - 1]);
        continue;
      }
      if (i == "drop") {
        if (this.stack.length == 0) throw Exception("Stack empty");
        this.stack.removeLast();
        continue;
      }
      if (i == "swap") {
        if (this.stack.length < 2) throw Exception("Stack empty");
        var temp = this.stack[this.stack.length - 2];
        this.stack[this.stack.length - 2] = this.stack[this.stack.length - 1];
        this.stack[this.stack.length - 1] = temp;
        continue;
      }
      if (i == "over") {
        if (this.stack.length < 2) throw Exception("Stack empty");
        this.stack.add(this.stack[this.stack.length - 2]);
        continue;
      }
      if (!this.definitions.keys.contains(i))
        throw Exception("Unknown command");
    }
  }
}