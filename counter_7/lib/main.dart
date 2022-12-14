import 'package:flutter/material.dart';
import 'package:counter_7/Page/tambah_budget.dart';
import 'package:counter_7/Page/data_budget.dart';
import 'package:counter_7/Model/user.dart';

import 'Page/drawer.dart';
 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter_7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = "Program Counter";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: drawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          if(_counter%2 == 0)
            Text(
              'GENAP', style: TextStyle(color: Colors.red,),
            )
          else
            Text(
              'GANJIL', style: TextStyle(color: Colors.blue,)
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding (
      padding: const EdgeInsets.only(left : 30), 
      child : Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        if (_counter > 0) FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove)
        ), 
        Expanded (child: Container ()),
        FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        ),
      ]))
    );
  }
}
