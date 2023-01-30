import 'package:flutter/material.dart';
import 'package:learn_state_management_provider/models/application_color.dart';
import 'package:provider/provider.dart';

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //! if you put the consumer widget as the parent of scaffold
    //! the provider will refresh the whole child of scaffold
    return Scaffold(
      backgroundColor: context.read<ApplicationColor>().bgColor,
      appBar: AppBar(
        title: Text(
          "Provider State Management",
          style: TextStyle(
            color: context.watch<ApplicationColor>().bgColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: context.watch<ApplicationColor>().color,
        actions: const [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ApplicationColor>(
              builder: ((context, value, child) => AnimatedContainer(
                    height: 100,
                    width: 100,
                    duration: const Duration(seconds: 1),
                    color: value.color,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Amber",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Consumer<ApplicationColor>(
                  builder: ((context, value, child) => Switch(
                      value: value.isBlue,
                      overlayColor:
                          MaterialStatePropertyAll<Color?>(value.color),
                      thumbColor: MaterialStatePropertyAll<Color?>(value.color),
                      trackColor: MaterialStatePropertyAll<Color?>(value.color),
                      onChanged: (newValue) {
                        value.isBlue = newValue;
                      },)),
                ),
                const Text(
                  "Blue",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
