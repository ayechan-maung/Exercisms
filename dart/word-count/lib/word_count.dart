class WordCount {
  // Put your code here
  var value = Map<String, dynamic>();
  Map<String, dynamic> countWords(String word) {
    RegExp exp = RegExp(r"([\w]+[\'][\w]+|\d+|\w+)");

    Iterable allMatches = exp.allMatches(word.toLowerCase());
    for (var word in allMatches) {
      if (value.containsKey(word[0])) {
        value[word[0].toString()] += 1;
      } else {
        value[word[0].toString()] = 1;
      }
    }
    return value;
  }
}
