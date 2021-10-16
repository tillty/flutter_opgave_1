import 'package:flutter/material.dart';
import 'dart:async';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    Key? key,
    // Takes lag value in constructer in order to create lagged timers
    required this.lag,
  }) : super(key: key);

  final int lag;
  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer(super.widget.lag);
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void startTimer(int lag) {
    timer = Timer.periodic(
        // Through callback setState is called every lag + 1 seconds
        Duration(seconds: lag + 1),
        (_) => setState(() {
              // Updating Duration widget with the new time.
              duration = Duration(seconds: duration.inSeconds + 1);
            }));
  }
}
