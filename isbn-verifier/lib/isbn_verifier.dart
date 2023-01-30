bool isValid(String number) {
  number = number.replaceAll("-", "");
  if (number.length != 10) return false;
  
  var sum = 0;
  for (int i = 0; i < 9; i++) {
    int digit = number.codeUnitAt(i) - 48;
    if (digit < 0 || digit > 9) return false;
    sum += digit * (10 - i);
  }
  
  int checkDigit = number.codeUnitAt(9);
  if (checkDigit == 88) {
    sum += 10;
  } else {
    checkDigit -= 48;
    if (checkDigit < 0 || checkDigit > 9) return false;
    sum += checkDigit;
  }

  return sum % 11 == 0;
}
