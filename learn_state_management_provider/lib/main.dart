import 'package:flutter/material.dart';
import 'package:learn_state_management_provider/models/application_color.dart';
import 'package:learn_state_management_provider/pages/animated_screen.dart';
import 'package:learn_state_management_provider/pages/increment_age.dart';
import 'package:learn_state_management_provider/pages/learn_stream.dart';
import 'package:learn_state_management_provider/pages/multi_provider_demo.dart';
import 'package:provider/provider.dart';

import 'models/person.dart';
import 'pages/first_page.dart';

main() {
  runApp(const MyApp());
}

//! provider statemanagement
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //make sure that ur provider is on the top of any other widget
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiProviderDemo(),
      
    );
  }
}
