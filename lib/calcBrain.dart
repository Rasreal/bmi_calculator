import 'package:flutter/material.dart';
import 'dart:math';
import 'constants.dart';

class CalcBrain {
  final double weight;
  final double height;
  Widget overweight = Text(
    'OVERWEIGHT',
    style: TextStyle(color: Colors.red[800], fontSize: 40),
  );
  Widget underweight = Text(
    'UNDERWEIGHT',
    style: TextStyle(color: Colors.orange[700], fontSize: 40),
  );
  Widget normal = Text(
    'NORMAL',
    style: TextStyle(color: Colors.greenAccent, fontSize: 40),
  );
  double _bmi = 0;

  CalcBrain({required this.weight, required this.height});

  String CalcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  Widget getRes() {
    if (_bmi >= 25.00 && _bmi < 1000.00) {
      return overweight;
    } else if (_bmi > 18.00 && _bmi < 25.00) {
      return normal;
    } else {
      return underweight;
    }
  }

  String getInterp() {
    if (_bmi >= 25) {
      return 'You are a fat ass, so go hit the gym';
    } else if (_bmi > 18 && _bmi < 25) {
      return 'You r ok, but not big enough';
    } else {
      return 'Skinny bitch, go bulk';
    }
  }
}
