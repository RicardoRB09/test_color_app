import 'dart:math';

import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  Color _color = Colors.white;
  bool _isTimeToShake = false;
  int _randomFontSize = 201;
  bool _isAnimate = false;

  Color get color => _color;

  void generateRandomColor() {
    _color = getRandomColor();
    notifyListeners();
  }

  bool get isTimeToShake => _isTimeToShake;

  set isTimeToShake(bool value) {
    _isTimeToShake = value;
    notifyListeners();
  }

  int get randomFontSize => _randomFontSize;

  void generateRandomFontSize() {
    _randomFontSize = Random().nextInt(170) + 30;
  }

  bool get isAnimate => _isAnimate;

  set isAnimate(bool value) {
    _isAnimate = value;
  }
}

Color getRandomColor() {
  final random = Random();
  final red = random.nextInt(255);
  final green = random.nextInt(255);
  final blue = random.nextInt(255);

  return Color.fromARGB(255, red, green, blue);
}
