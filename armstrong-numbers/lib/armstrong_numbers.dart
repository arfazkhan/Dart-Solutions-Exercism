
class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    BigInt sum = BigInt.zero;
    final digits = number.split('');
    final len = digits.length;

    for (final digit in digits) {
      sum += BigInt.parse(digit).pow(len);
    }

    return sum == BigInt.parse(number);
  }
}
