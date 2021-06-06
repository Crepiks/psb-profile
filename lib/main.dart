import 'package:flutter/material.dart';
import "package:micro_mobile/micro_mobile.dart";
import 'package:profile/app.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final Store store = Store();

  App() {
    store.registerEvent('TRANSACTION_ADD');
    store.registerEvent('NAVIGATE_PAYMENTS');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Micro App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(
        store: store,
      ),
    );
  }
}
