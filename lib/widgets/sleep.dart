import 'package:flutter/material.dart';

class SleepPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'The average human takes 15 minutes to fall asleep. If you wake up at one of these times, you’ll rise in between 90-minute sleep cycles.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  sleepNow(context);
                },
                child: Text('Sleep Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sleepNow(BuildContext context) {
    DateTime now = DateTime.now();
    int hours = now.hour;
    int minutes = now.minute;

    // Calculate the waking time by adding 7 hours and 30 minutes
    DateTime alarmTime = now.add(Duration(hours: 7, minutes: 30));

    int alarmHours = alarmTime.hour;
    int alarmMinutes = alarmTime.minute;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sleep Result'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("It's $hours:$minutes now."),
              SizedBox(height: 8.0),
              Text(
                'You should set your alarm at ${alarmHours.toString().padLeft(2, '0')}:${alarmMinutes.toString().padLeft(2, '0')}.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
