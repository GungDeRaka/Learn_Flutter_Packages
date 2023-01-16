import 'package:flutter/material.dart';
import 'package:learn_state_management_provider/models/person.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(child: Text(context.read<Person>().age.toString(),
      style: TextStyle(
      fontSize: 28.0,
      ),
      ),),
    );
  }
}
