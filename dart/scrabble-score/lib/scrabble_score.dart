// Put your code here

const wordValues = {
  "aeioulnrst": 1,
  "dg":2,
  "bcmp":3,
  "fhvwy":4,
  "k":5,
  "jx":8,
  "qz": 10
};

int score([String? letter]){

  final result =  letter!.split('').fold(0, (val, e) {
    var values = wordValues.keys.singleWhere((element) => element.contains(e.toLowerCase()),);
    return val + wordValues[values]!;
  });
  return result;

}
