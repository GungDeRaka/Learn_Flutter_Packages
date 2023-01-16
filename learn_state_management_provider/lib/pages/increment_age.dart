import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/person.dart';

class IncreaseAge extends StatelessWidget {
  const IncreaseAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions:  [
          ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          ),
          child: const Icon(Icons.minimize),
              onPressed: () {
                
                context.read<Person>().decrementAge();
                //
              },
          ),
        ],
      ),
      body: const Center(
        child: Content(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<Person>().incrementAge();
          
          //
        },
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Person>(
      builder: (_, person, __) => Text(
        person.age.toString(),
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
