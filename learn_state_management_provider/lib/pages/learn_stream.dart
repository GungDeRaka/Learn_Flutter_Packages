// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class LearnStreams extends StatefulWidget {
  const LearnStreams({Key? key}) : super(key: key);

  @override
  State<LearnStreams> createState() => _LearnStreamsState();
}

class _LearnStreamsState extends State<LearnStreams> {
  Stream<int> counter() async* {
    await Future.delayed(const Duration(seconds: 4));
    yield 1;
    await Future.delayed(const Duration(seconds: 2));
    yield 2;
    await Future.delayed(const Duration(seconds: 3));
    yield 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Center(
        child: StreamBuilder(
          stream: counter(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Text(
                    "please wait...",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : (snapshot.hasData)
                    ? Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : (snapshot.hasError)
                        ? const Text(
                            "Fail to fetch data",
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          )
                        : (snapshot.connectionState == ConnectionState.done)
                            ? Container(
                                color: Colors.red,
                              )
                            : Container(
                                color: Colors.green,
                              );
          },
        ),
      ),
    );
  }
}
