import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/services/api_service.dart';
import 'package:rick_and_morty/views/main/main_screen.dart';
import 'package:rick_and_morty/app/locator.dart';

void main() {
  setUpLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            ApiService();
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

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
