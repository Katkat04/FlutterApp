import 'package:flutter/material.dart';
import 'package:hello_world/features/authentication/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        fontFamily: 'AdihausDIN',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white10,
          titleTextStyle: TextStyle(
            fontFamily: 'AdihausDIN',
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: const  LoginScreen()
    );
  }
}