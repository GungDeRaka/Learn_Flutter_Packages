import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller =
      TextEditingController(text: "No Name");
  bool isOn = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nama", _controller.text);
    pref.setBool("ison", isOn);
  }

Future<String> loadNama ( ) async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  return pref.getString("nama") ?? "No Name";
}
Future<bool> loadBool ( ) async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  return pref.getBool("ison") ?? false;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //textfield with controller
          TextField(
            controller: _controller,
          ),
          //switch button
          Switch(
              value: isOn,
              onChanged: (newValue) {
                isOn = newValue;
                setState(() {});
              }),
          //save pref button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            onPressed: () {setState(() {
              saveData();
            });},
            child: const Text("Save"),
          ),
          //load pref button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            onPressed: () {
              setState(() {
                loadNama().then((value) => _controller.text = value);
                loadBool().then((value) => isOn = value);
              });
            },
            child: const Text("Load"),
          ),
        ],
      )),
    );
  }
}
