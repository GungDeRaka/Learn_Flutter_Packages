import 'package:date_picker/mini_reminder_app.dart';
import 'package:flutter/material.dart';
import 'my_date_picker.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Learn How To Use Date Picker",
      home: MiniReminder(),
    );
  }
}