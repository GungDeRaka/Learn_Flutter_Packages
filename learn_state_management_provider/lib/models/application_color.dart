import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isBlue = true;

  bool get isBlue => _isBlue;
  set isBlue(bool value) {
    _isBlue = value;
    notifyListeners();
  }

  Color get color => _isBlue ? Colors.blue : Colors.amber;
  Color get bgColor => _isBlue ? Colors.black45 : Colors.blueGrey;
}
