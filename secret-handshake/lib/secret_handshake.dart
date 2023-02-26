class SecretHandshake {
  final List<String> _actions = [
    'wink',
    'double blink',
    'close your eyes',
    'jump',
  ];

  List<String> commands(int number) {
    var actions = <String>[];
    for (var i = 0; i < _actions.length; i++) {
      if ((number & (1 << i)) != 0) {
        actions.add(_actions[i]);
      }
    }
    if ((number & 0x10) != 0) {
      actions = actions.reversed.toList();
    }
    return actions;
  }
}
