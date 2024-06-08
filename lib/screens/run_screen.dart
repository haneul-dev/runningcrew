import 'package:flutter/material.dart';
import 'dart:async';

class RunScreen extends StatefulWidget {
  @override
  _RunScreenState createState() => _RunScreenState();
}

class _RunScreenState extends State<RunScreen> {
  late Timer _timer;
  int _seconds = 0;
  double _distance = 0.0;
  final double pacePerMinute = 6.0; // 1분당 6분/km를 가정

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
        // 매 초마다 pacePerMinute(분당 km)를 기준으로 거리를 증가시킵니다.
        _distance += (1 / pacePerMinute) / 60; // 매 초당 거리 증가
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int minutes = _seconds ~/ 60;
    final int remainingSeconds = _seconds % 60;
    final double pace = _seconds > 0 ? (_seconds / 60) / _distance : 0.0;

    return Scaffold(
      appBar: AppBar(title: Text('On_Start')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "${pace.toStringAsFixed(2)}'",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("페이스"),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("시간"),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              _distance.toStringAsFixed(2),
              style: TextStyle(fontSize: 48),
            ),
            Text("킬로미터"),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _timer.cancel();
              },
              child: Text("완주"),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}