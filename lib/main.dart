import 'package:flutter/material.dart';
import 'package:pomodoro_timer/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro Timer',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: HomePage(),
    );
  }
}
