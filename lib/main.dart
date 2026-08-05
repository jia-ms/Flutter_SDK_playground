/* 'package:counterapp/screens/assets_demo_screen.dart';
import 'package:counterapp/screens/e_commerce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'todolist.dart';
import 'package:flutter/material.dart';
import 'package:counterapp/screens/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      title: "Flutter Course",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const ProductListScreen(),
    );
  }
}

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounterApp Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<StatefulWidget> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementValue() {
    setState(() {
      _counter++;
    });
  }

  void _decrementValue() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter Value"),
            SizedBox(height: 16),
            Text('$_counter', style: TextStyle(fontSize: 40)),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decrementValue, child: Text("-")),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _resetCounter();
                  },
                  child: Text("Reset"),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _incrementValue();
                  },
                  child: Text("+"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
  //    home: const UserListScreen(),
    );
  }
  */

