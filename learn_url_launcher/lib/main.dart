import 'package:flutter/material.dart';
// to using the url launcher, u need to import url_launcher

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Uri url = Uri.parse('https://amazon.com');
  final String email = "aswinraka4@gmail.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn URL Launncher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LauncherButton(
              title: "Example from Documentation ",

              /// launchUrl is a future function, so u need add async keyword on onTap argument
              onTap: (() async {
                _launchUrl(url);
              }),
            ),
            LauncherButton(
                title: "SMS",
                onTap: () async {
                  msgSomone();
                }),
            LauncherButton(
                title: "E-Mail",
                onTap: () async {
                  sendEmail(email);
                }),
            LauncherButton(
                title: "Call",
                onTap: () async {
                  await callSomeone();
                }),
            LauncherButton(
                title: "LAUNCH!",
                onTap: () async {
                  await openInWeb();
                }),
            LauncherButton(
                title: "LAUNCH GITHUB !",
                onTap: () async {
                  await openMyGH();
                }),
          ],
        ),
      ),
    );
  }
}

class LauncherButton extends StatelessWidget {
  /// use [title] to add text in ur button
  final String title;

  /// [onTap] a fuction will called when u tap the button
  ///
  final void Function() onTap;
  const LauncherButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blue,
        shape: const StadiumBorder(),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}

/// [_launchUrl] use for validating if the url doesnt exist
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url,
      //inAppWebView is a mode that allow u to open the url without using any browser
      //the url will opened right in ur apps
      mode: LaunchMode.inAppWebView,
      //u could add some configuration for your webview, such as:
      webViewConfiguration: const WebViewConfiguration(
        // the default value of these 2 configurations are true
          enableDomStorage: false, enableJavaScript: false))) {
    throw 'Could not launch $url';
  }
}

Future<void> sendEmail(String email) async {
  await launchUrl(Uri(
      // hover the [scheme] to read the documentation
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': 'Example', 'body': 'hallo'}));
}

Future<void> openInWeb({String? phoneNumber}) async {
  await launchUrl(
      Uri(scheme: 'https', host: "pub.dev", path: 'packages/url_launcher'),
      mode: LaunchMode.externalApplication);
}
Future<void> openMyGH({String? phoneNumber}) async {
  await launchUrl(
      Uri(scheme: 'https', host: "github.com", path: 'GungDeRaka'),
      mode: LaunchMode.inAppWebView);
}

Future<void> callSomeone({String? phoneNumber}) async {
  await launchUrl(Uri(scheme: 'tel', path: '+6282341822787'));
}

Future<void> msgSomone({String? phoneNumber}) async {
  await launchUrl(Uri(scheme: 'sms', path: '+6282341822787'));
}
