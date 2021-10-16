import 'package:flutter/material.dart';
import 'package:ten_timers/timer_widget.dart';

void main() {
  runApp(const TenTimers());
}

class TenTimers extends StatelessWidget {
  const TenTimers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tillty Timers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tilty State Management Task'),
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
      body: SafeArea(
        child: ListView(
          children: const <Widget>[
            SizedBox(height: 4),
            TimerWidget(lag: 0),
            SizedBox(height: 4),
            TimerWidget(lag: 1),
            SizedBox(height: 4),
            TimerWidget(lag: 2),
            SizedBox(height: 4),
            TimerWidget(lag: 3),
            SizedBox(height: 4),
            TimerWidget(lag: 4),
            SizedBox(height: 4),
            TimerWidget(lag: 5),
            SizedBox(height: 4),
            TimerWidget(lag: 6),
            SizedBox(height: 4),
            TimerWidget(lag: 7),
            SizedBox(height: 4),
            TimerWidget(lag: 8),
            SizedBox(height: 4),
            TimerWidget(lag: 9),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
