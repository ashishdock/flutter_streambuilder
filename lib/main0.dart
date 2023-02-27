import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final StreamController<int> streamController = StreamController();
  int counter = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamController.close();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
                initialData: 0,
                stream: streamController.stream,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Text(
                        'You have pushed the button this many times: ${snapshot.data}',
                      ),
                      Text(
                        "Square of number ${snapshot.data} is ${pow(snapshot.data!, 2)}",
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Cube of ${snapshot.data} is ${pow(snapshot.data!, 3)}",
                          ),
                        ],
                      )
                    ],
                  );
                }),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () => streamController.sink.add(++counter),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
