class Bob {
  String response(String message) {
    message = message.trim();
    if (message.isEmpty) return 'Fine. Be that way!';
    bool isQuestion = message.endsWith('?');
    bool isYelling = message.toUpperCase() == message && message.contains(RegExp('[A-Z]'));
    return isQuestion
        ? isYelling ? 'Calm down, I know what I\'m doing!' : 'Sure.'
        : isYelling ? 'Whoa, chill out!' : 'Whatever.';
  }
}
