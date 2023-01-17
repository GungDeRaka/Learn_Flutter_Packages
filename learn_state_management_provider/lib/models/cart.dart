import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  int _cart = 0;
  int get cart => _cart;
  set cart(int value) {
    _cart = value;
    notifyListeners();
  }
}
