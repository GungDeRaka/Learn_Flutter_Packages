// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MiniReminder extends StatefulWidget {
  const MiniReminder({Key? key}) : super(key: key);

  @override
  State<MiniReminder> createState() => _MiniReminderState();
}

class _MiniReminderState extends State<MiniReminder> {
  /// [reminded] sebagai list penampung widget hari-hari yang telah dipilih
  List<Widget> reminded = [];
  DateTime? minYear = DateTime(2000);
  DateTime? maxYear = DateTime(2100);
  DateTime? reminder = DateTime.now();
  TextEditingController _textController = TextEditingController();
  String hariSpesial = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mini Monthly Reminder App"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //! pada beberapa kasus kita harus menggunakan column untuk menampung list of widget
        //! coba ganti Column() dengan ListView, penambahan anggota list tidak akan ditampilkan di layar
        child: SingleChildScrollView(
          controller: ScrollController(),
          
          child: Column(
            children: reminded,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          ).then((value) {
            reminder = value!;
            setState(() {});
            alertDialog();
          });
        },
      ),
    );
  }

  void alertDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Event Spesial?'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tanggal ${reminder!.day}, Bulan ${DateFormat.MMMM().format(reminder!)}\nHari spesial apa?",
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Event apa?',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                hariSpesial = _textController.text;
                reminded.add(ListTile(
                  leading: const Icon(Icons.crop_square_sharp),
                  title: Text(hariSpesial),
                  subtitle: Text(
                      "$hariSpesial pada tanggal ${reminder!.day} ${DateFormat.MMMM().format(reminder!)}"),
                ));
                setState(() {});
                _textController.clear();
                Navigator.pop(context);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
