import 'package:flutter/material.dart';

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
    if(_counter >0){
      setState(() {
         _counter--;
      });
    }
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


