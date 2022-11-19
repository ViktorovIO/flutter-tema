import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tema/screens/main_page.dart';
import 'package:tema/screens/splash_page.dart';

import 'const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          //scrolledUnderElevation: 0.5,
        ),
      ),
      home: const SplashPage(),
    );
  }
}
