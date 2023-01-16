import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_state_management_provider/models/person.dart';
import 'package:learn_state_management_provider/pages/second_page.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    Person person = context.read<Person>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SecondPage()));
            },
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              size: 24.0,
            ),
          ),
          IconButton(
            onPressed: () {
              // this is how u change the value of some variable
              // u also could use [context.read] to display the value on the screen
              person.age = Random().nextInt(90);
              // there also 2 ways to get the Person() properties
              context.read<Person>().name = "Jecky";
              setState(() {});
            },
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
        title: Text("FirstPage"),
      ),
      body: Center(
        child: Text(
          // Person().name == null
          "${context.read<Person>().name}\n${Person().name}",
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
