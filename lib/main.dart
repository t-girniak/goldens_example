import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Goldens Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Goldens demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          _Item(
            color: Colors.red,
            key: Key(Colors.red.toString()),
          ),
          _Item(
            color: Colors.green,
            key: Key(Colors.green.toString()),
          ),
          const _Item(color: Colors.orange),
          const _Item(color: Colors.cyan),
          const _Item(color: Colors.pink),
          const _Item(color: Colors.black),
          const _Item(color: Colors.brown),
          const _Item(color: Colors.blueGrey),
          const _Item(color: Colors.grey),
          const _Item(color: Colors.lightGreen),
          const _Item(color: Colors.deepPurple),
          const _Item(color: Colors.deepOrange),
          const _Item(color: Colors.blue),
          _Item(
            color: Colors.yellow,
            key: Key(Colors.yellow.toString()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Color color;

  const _Item({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
    );
  }
}
