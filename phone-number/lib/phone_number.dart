class PhoneNumber {
  static final invalidCharacters = RegExp(r'[\s-_().+]');
  static final letters = RegExp(r'[a-zA-Z]');
  static final punctuations = RegExp(r'[@:!]');
  
  String clean(String phoneNumber) {
    final sanitized = phoneNumber.replaceAll(invalidCharacters, '');
    final formatted = _validate(sanitized).replaceFirst('1', '');
    return formatted;
  }
  
  String _validate(String phoneNumber) {
    if (phoneNumber.length < 10) throw FormatException('incorrect number of digits');
    if (phoneNumber.length == 11) {
      if (!phoneNumber.startsWith('1')) throw FormatException('11 digits must start with 1');
      phoneNumber = phoneNumber.substring(1);
    }
    if (phoneNumber.length > 10) throw FormatException('more than 11 digits');
    if (letters.hasMatch(phoneNumber)) throw FormatException('letters not permitted');
    if (punctuations.hasMatch(phoneNumber)) throw FormatException('punctuations not permitted');
    if (phoneNumber[0] == '0') throw FormatException('area code cannot start with zero');
    if (phoneNumber[0] == '1') throw FormatException('area code cannot start with one');
    if (phoneNumber[3] == '0') throw FormatException('exchange code cannot start with zero');
    if (phoneNumber[3] == '1') throw FormatException('exchange code cannot start with one');
    return phoneNumber;
  }
}
