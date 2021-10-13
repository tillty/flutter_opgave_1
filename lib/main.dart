import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_opgave/timer.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestApp(),
    );
  }
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: List.generate(
            10,
            (index) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Timer(
                      key: Key(index.toString()),
                      timeBetweenRerender: Duration(seconds: index + 1),
                    ),
                  ),
                )),
      ),
    );
  }
}
