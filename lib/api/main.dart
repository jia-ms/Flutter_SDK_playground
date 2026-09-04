import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart%20';
//import 'package:counterapp/api/screens/api_home_screen.dart';
//import 'package:counterapp/api/screens/photoshomescree.dart';
import 'package:counterapp/api/screens/commentshomescreen.dart';

void main() {
  runApp(const MyApiApp());
}

class MyApiApp extends StatelessWidget {
  const MyApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      title: "Posts App",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
      ),
      home: const CommentsHomeScreen(),
    );
  }
}