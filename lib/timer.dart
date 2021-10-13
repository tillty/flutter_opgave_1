import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  final Duration updateTimerInterval;

  const Timer({Key? key, required this.updateTimerInterval}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  DateTime startTime = DateTime.now();
  Duration duration = const Duration(seconds: 0, minutes: 0);

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_getMinutesAsStringFormat()}:${_getSecondsAsStringFormat()}',
      style: const TextStyle(color: Colors.white, decoration: TextDecoration.none),
    );
  }

  String _getMinutesAsStringFormat() {
    int minutes = duration.inMinutes;

    if (minutes == 0) {
      return "0" + minutes.toString();
    }

    if (_isBetweenZeroAndTenMinutes()) {
      return "0" + minutes.toString();
    }

    return minutes.toString();
  }

  String _getSecondsAsStringFormat() {
    int seconds = duration.inSeconds;
    int minutes = duration.inMinutes;

    if (minutes > 0) {
      seconds = duration.inSeconds % 60;
    }

    if (seconds < 10) {
      return "0" + seconds.toString();
    }

    return seconds.toString();
  }

  void _initializeTimer() {
    Future.delayed(widget.updateTimerInterval, _updateAndReinitializeTimer);
  }

  void _updateAndReinitializeTimer() {
    setState(() {
      duration = DateTime.now().difference(startTime);
    });
    _initializeTimer();
  }

  bool _isBetweenZeroAndTenMinutes() => duration.inMinutes > 0 && duration.inMinutes < 10;
}
