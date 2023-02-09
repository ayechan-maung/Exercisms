class SpaceAge {
  // Put your code here

  final earth = 31557600;

  Map<String, double> periods = {
    'Mercury': 0.2408467,
    'Venus': 0.61519726,
    'Mars': 1.8808158,
    'Jupiter': 11.862615,
    'Saturn': 29.447498,
    'Uranus': 84.016846,
    'Neptune': 164.79132,
    'Earth': 1,
  };

  num age({required String planet, required int seconds}) =>
      num.parse((seconds / (periods[planet]! * earth)).toStringAsFixed(2));
}
