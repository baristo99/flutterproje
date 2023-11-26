import 'package:flutter/material.dart';
import 'dart:async';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer = Timer(Duration.zero, () {});
  int _secondsElapsed = 0;
  bool _isTimerRunning = false;
  List<String> _savedTimings = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
    setState(() {
      _isTimerRunning = false;
      _savedTimings.add(formatTime(_secondsElapsed));
    });
  }

  void resetTimer() {
    _timer.cancel();
    setState(() {
      _secondsElapsed = 0;
      _isTimerRunning = false;
      _savedTimings.clear();
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedTime =
        '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _timer.cancel();
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Timer Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Text(
              formatTime(_secondsElapsed),
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!_isTimerRunning) {
                      startTimer();
                      setState(() {
                        _isTimerRunning = true;
                      });
                    }
                  },
                  child: Text('Start'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_isTimerRunning) {
                      stopTimer();
                    }
                  },
                  child: Text('Stop'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: Text('Reset'),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Saved Timings:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _savedTimings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _savedTimings[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
