// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//* try to learn date picker in Flutter
class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key}) : super(key: key);

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  //helper method to call date picker
  ///DatePicker is a part of material package
  void _showDateTime() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        // builder: (context, child) => Container(color: Colors.green,),
        ).then((value) {
      dateText = value!;
      setState(() {});
    });
  }

//variable to store date time and the changes
  DateTime dateText = DateTime.now();
  DateTime dateText2 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn How To Use Date Picker"),
        actions: const [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Tanggal : $dateText \nHari: ${dateText.day} \nBulan: ${dateText.month}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Tanggal : $dateText2 \nHari: ${dateText2.day} \nBulan: ${dateText2.month}\nBulan: ${dateText2.timeZoneName}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueGrey,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(64.0),
                    ),
                  ),
                  onPressed: () async {
                    _showDateTime();
                  },
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () async {
                    //? another way to call datepicker
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: dateText2,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    dateText2 = pickedDate!;
                    setState(() {});
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
            // DateRangePickerDialog(
            //   firstDate: DateTime(2022),
            //   lastDate: DateTime(2023),
            //   currentDate: DateTime.now(),
            //   errorFormatText: ,
            // )
          ],
        ),
      ),
    );
  }
}
