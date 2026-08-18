import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:counterapp/screens/inherited_widgets_ex/user_provider.dart';
//import 'package:counterapp/screens/navigation/home_screen0.dart';
//import 'package:counterapp/screens/navigation/screen_1.dart';
//import 'app1/screen/home_screen.dart';
//import 'package:counterapp/grocery_store/screens3/homescreen2.dart';
//import 'package:counterapp/auth/login_screen.dart';
import 'package:counterapp/screens/Counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userName: "jia",
      email: "jiams@gmail.com",
      child: MaterialApp(
        title: "Flutter Course",
        debugShowCheckedModeBanner: kDebugMode,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
            brightness: Brightness.light,
            // primary: Colors.lightBlueAccent
          ),
          textTheme: TextTheme(
              titleMedium: const TextStyle(fontSize: 32, color: Colors.white),
              bodyMedium: GoogleFonts.acme(),
              labelMedium: GoogleFonts.vampiroOne()
          ),
          // primarySwatch: Colors.yellow,
        ),
        home: const CounterPage(),
      ),
    );
  }
}

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text(
            'HELLO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
} */