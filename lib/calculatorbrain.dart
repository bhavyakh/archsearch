import 'dart:math';

class calculate {
  calculate({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String bmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25)
      return 'OVERWEIGHT';
    else if (_bmi >= 18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String interpretation() {
    if (_bmi >= 25)
      return 'You have higher than normal body weight.Try to exercise more';
    else if (_bmi >= 18.5)
      return 'You have a normal body weight.Good work!';
    else
      return 'You have lower than normal body weight.Eat more';
  }
}
