import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  int height;
  int weight;

  CalculatorBrain({@required this.height, @required this.weight});
  double _bmi;

  String calculateResult() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResultMsg() {
    if (_bmi < 19) {
      return "You need to eat more !";
    } else if (_bmi >= 25) {
      return "You need to eat less and healthy !";
    } else {
      return "You are fit !";
    }
  }

  String getResultStatus() {
    if (_bmi < 20) {
      return "UnderWeight";
    } else if (_bmi >= 25) {
      return "OverWeight";
    } else {
      return "Healthy";
    }
  }
}
