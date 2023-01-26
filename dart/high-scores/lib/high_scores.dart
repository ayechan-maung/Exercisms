class HighScores {
  // Put your code here
  List<int> scores;
  HighScores(this.scores)
  {
    // Need to make a copy to avoid public variable changes.
    _scores = List.from(scores);
  }

  /////

  List<int>? _scores;


  int latest() => _scores!.last;

  int personalBest()=> _scores!.reduce((c, n) => c > n? c: n);

  void setScore(List<int> input) {
    this._scores = input;
  }

  List<int> personalTopThree() {

    _scores!.sort(((a, b) => b.compareTo(a)));

    if(_scores!.length < 3){
      return _scores!;
    }
    List<int> threeScores = _scores!.sublist(0,3);
    setScore(threeScores);
    return threeScores;
  }
}