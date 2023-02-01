class Forth {
  // Put your code here

  List<int> stack = [];
  Map<String, String> _defineWords = {};

  String expandDefinedWords(String statement) {
    _defineWords.entries.forEach((word) {
      statement = statement.replaceAll(word.key, word.value);
    });
    return statement;
  }

  void evaluate(String input) {
    List<String> values = input.toLowerCase().split(" ");

    if (values.first == ":" && values.last == ";") {
      final key = values[1];
      if (int.tryParse(key) != null) {
        throw Errors("Exception: Invalid definition");
      }
      var defineWord = values.sublist(2, values.length - 1).join(' ');
      defineWord = expandDefinedWords(defineWord);
      _defineWords[key] = defineWord;
      return;
    }
    values = expandDefinedWords(input.toLowerCase()).split(" ");
    for (final value in values) {
      var parse = int.tryParse(value);
      if (parse != null) {
        stack.add(parse);
      } else {
        arithmetic(value);
      }
    }
  }

  void arithmetic(String sign) {
    switch (sign) {
      case "+":
        addition();
        break;
      case "-":
        substraction();
        break;
      case "*":
        multiplication();
        break;
      case "/":
        division();
        break;
      case "swap":
        swap();
        break;
      case "dup":
        dup();
        break;
      case "drop":
        drop();
        break;
      case "over":
        over();
        break;
      default:
        throw Errors("Exception: Unknown command");
    }
  }

  void push(int value) {
    stack.add(value);
  }

  int pop() => stack.removeLast();

  void addition() {
    if (stack.length < 2 || stack.isEmpty) {
      throw Errors("Exception: Stack empty");
    }
    int first = pop();
    int second = pop();
    push(first + second);
  }

  void substraction() {
    if (stack.length < 2 || stack.isEmpty) {
      throw Errors("Exception: Stack empty");
    }
    int second = pop();
    int first = pop();
    push(first - second);
  }

  void multiplication() {
    if (stack.length < 2 || stack.isEmpty) {
      throw Errors("Exception: Stack empty");
    }
    int first = pop();
    int second = pop();
    push(first * second);
  }

  void division() {
    int second = pop();
    int first = pop();
    if (second == 0) {
      throw Errors("Exception: Division by zero");
    } else if (stack.length < 2 || stack.isEmpty) {
      throw Errors("Exception: Stack empty");
    }
    push(first ~/ second);
  }

  void dup() {
    if (stack.isEmpty) {
      throw Errors("Exception: Stack empty");
    }
    push(stack.last);
  }

  void drop() {
    if (stack.isEmpty) {
      throw Errors("Exception: Stack empty");
    }
    stack.removeLast();
  }

  void swap() {
    if (stack.length < 2) {
      throw Errors("Exception: Stack empty");
    }
    var s2 = pop();
    var s1 = pop();
    stack.addAll([s2, s1]);
  }

  void over() {
    if (stack.length < 2) {
      throw Errors("Exception: Stack empty");
    }
    push(stack[stack.length - 2]);
  }
}

class Errors implements Exception {
  final String message;
  Errors(this.message);

  @override
  String toString() => "$message";
}

void main(List<String> args) {
  final forth = Forth();

  // forth.evaluate('1 2 + 4 -');
  forth.evaluate(': foo 5 ;');
  forth.evaluate(': bar foo ;');
  forth.evaluate(': foo 6 ;');
  forth.evaluate('bar foo');
  // forth.evaluate(': foo 10 ;');
  //   forth.evaluate(': foo foo 1 + ;');
  //   forth.evaluate('foo');
}
