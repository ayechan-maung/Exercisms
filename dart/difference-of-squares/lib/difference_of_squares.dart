import 'dart:math';

class DifferenceOfSquares {
  // Put your code here
  int squareOfSum(int number){
    var result = 0;
    for(var i=1; i< number + 1; i++){
      result += i;
    }
    result = pow(result, 2).toInt();
    print(result);

    return result;
  }

  int sumOfSquares(int number){
    var result = 0;
    for(var i=1; i< number + 1; i++){
      result += pow(i, 2).toInt();
    }
    print(result);
    return result;
  }
  int differenceOfSquares(int number){
    var result = 0;
  
    result = squareOfSum(number)- sumOfSquares(number);
    print(result);
    return result;
  }
}
