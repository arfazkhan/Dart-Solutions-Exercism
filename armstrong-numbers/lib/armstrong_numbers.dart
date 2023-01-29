import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String numString) {
  var digits = numString.split('');
  var len = digits.length;
  var sum = 0.0;
  for (var digit in digits) {
    sum += pow(int.parse(digit), len);
  }
  return sum == int.parse(numString);
}

}
