import 'package:flutter/material.dart';
import 'exercisereps.dart';
import 'caloriesburned.dart';

class ExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseCalculator(),
                  ),
                );
              },
              child: Text('Exercise Calculator'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseReps(maxSets: 3, maxReps: 10),
                  ),
                );
              },
              child: Text('Exercise Reps Sets'),
            ),
          ],
        ),
      ),
    );
  }
}
