import 'package:flutter/material.dart';

class Person extends ChangeNotifier {
  String? name;
  int? age;
  Person({
    this.name,
    this.age,
  });

  void incrementAge() {
    age = (age ?? 0) + 1;
    notifyListeners();
  }
  void decrementAge() {
    age = (age ?? 0) - 1;
    notifyListeners();
  }
}
