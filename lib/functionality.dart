import 'dart:math';

class FuncCalculator {
  int height;
  int weight;
  double _bmi=0;

  FuncCalculator({this.weight=0, this.height=0});

  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getInterparation() {
    if (_bmi >= 25) {
      return "You are a higher than the normal value. Do some sport!!!!!\n\n⛷🤺🏃‍♀️🏃‍♂️🏄‍♂️🏋️‍♂️🚴‍♀️";
    } else if (_bmi > 18.5) {
      return "The value is normal, you can be proud!\n\n😉";
    } else {
      return "You are a lower than the normal value. Eat more!!!\n\n🍔🍕🥞🍗🍚🍉";
    }
  }
}
