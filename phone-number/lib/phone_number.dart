class PhoneNumber {
  String clean(String number) {
    String cleaned = number.replaceAll(RegExp(r'[^\d]'), '');
    int len = cleaned.length;
    if (len == 11 && cleaned[0] == '1') cleaned = cleaned.substring(1, len);
    if (len != 10) throw FormatException("incorrect number of digits");
    if (cleaned.startsWith("0") || cleaned.startsWith("1", 3)) 
      throw FormatException("area or exchange code cannot start with 0 or 1");
    return cleaned;
  }
}
