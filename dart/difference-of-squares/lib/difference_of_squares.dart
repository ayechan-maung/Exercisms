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

//The most liked solution in exercism. 

class DifferenceOfSquare{
  //list
  Iterable<int> list(int val)=> new Iterable.generate(val, ((index) => index +1));
  //square
  int square(int val) => val * val;
  //sum
  int sum(int left, int right)=> left + right;

  int squareOfSums(int number) => square(list(number).reduce(sum));

  int sumsOfSquare(int number)=> list(number).map(square).reduce(sum);

  int differenceOfSquares(int number)=> squareOfSums(number) - sumsOfSquare(number);
}

void main(List<String> args) {
  final difference = DifferenceOfSquare();

  print("difference ${difference.differenceOfSquares(100)}");
}

