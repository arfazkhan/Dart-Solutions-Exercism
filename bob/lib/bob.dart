class Bob {
  String response(String message) {
    message = message.trim();
    if(message.isEmpty) {
      return 'Fine. Be that way!';
    }
    if(message.endsWith('?')) {
      return 'Sure.';
    }
    if(message.endsWith('!') || (message.toUpperCase() == message && message.contains(RegExp(r'[A-Z]')))) {
      return 'Whoa, chill out!';
    }
    return 'Whatever.';
  }
}