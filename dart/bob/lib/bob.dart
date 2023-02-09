class Bob {
  // Put your code here
  final fine = "Fine. Be that way!";
  final calm = "Calm down, I know what I'm doing!";
  final whoa = "Whoa, chill out!";
  final sure = "Sure.";
  final whatever = "Whatever.";

  String response(String input) {
    input = input.trim();
    bool isAsking = input.endsWith("?");
    bool isYelling =
        input == input.toUpperCase() && input.contains(RegExp(r'[a-zA-Z]'));

    if (input.isEmpty)
      return fine;
    else if (isYelling)
      return isAsking ? calm : whoa;
    else if (isAsking)
      return sure;
    else
      return whatever;
  }
}
