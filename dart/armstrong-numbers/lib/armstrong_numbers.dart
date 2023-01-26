

import 'dart:math';

class ArmstrongNumbers {
  // Put your code here

  // bool isArmstrongNumber([String? val]){
  //   final exponential = val?.length;
  //   final splitVal = val!.split('').map((e) => int.parse(e));
  //   final result = splitVal.fold(0, (sum, element) => sum + pow(element, exponential!).toInt());
  
  //   return val == result.toString();
  // }
  bool isArmstrongNumber(String number) {
    String textNumber = number.toString();
    return number ==
        textNumber
            .split('')
            .map((i) => pow(int.parse(i), textNumber.length))
            .reduce((a, b) => a + b);
  }
}
