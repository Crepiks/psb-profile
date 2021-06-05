import 'package:flutter/material.dart';
import "package:micro_mobile/micro_mobile.dart";
import 'package:profile/app.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final Store store = Store();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: SafeArea(
        child: ProfileScreen(
          store: store,
        ),
      )),
    );
  }
}
