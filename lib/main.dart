import 'package:flutter/material.dart';
import 'package:rick_and_morty/views/main/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Rich Material App',
      home: MainScreen(),
    );
  }
}
