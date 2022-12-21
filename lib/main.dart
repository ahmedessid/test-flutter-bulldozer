import 'package:flutter/material.dart';
import 'package:test_flutter_bulldozer/screens/shifts_offerts/shifts_offerts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Flutter Bulldozer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShiftsOffertsScreen(),
    );
  }
}
