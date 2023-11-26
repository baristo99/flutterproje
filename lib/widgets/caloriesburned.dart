import 'package:flutter/material.dart';

class ExerciseCalculator extends StatefulWidget {
  @override
  _ExerciseCalculatorState createState() => _ExerciseCalculatorState();
}

class _ExerciseCalculatorState extends State<ExerciseCalculator> {
  String? selectedExercise;
  int exerciseDuration = 0;

  Map<String, int> caloriesMap = {
    'Running': 10,
    'Cycling': 8,
    'Swimming': 12,
    'Jumping Rope': 15,
    'Strength Training': 6,
    'Dancing': 7,
    'Yoga': 4,
    'Hiking': 9,
    'Boxing': 14,
    'Rowing': 11,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select an exercise:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: selectedExercise,
              onChanged: (value) {
                setState(() {
                  selectedExercise = value;
                });
              },
              items: caloriesMap.keys.map((exercise) {
                return DropdownMenuItem<String>(
                  value: exercise,
                  child: Text(exercise),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Enter exercise duration (minutes):',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  exerciseDuration = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateCaloriesBurned,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Calories Burned:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '${calculateCaloriesBurned()}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  int calculateCaloriesBurned() {
    if (selectedExercise != null && exerciseDuration > 0) {
      int caloriesPerMinute = caloriesMap[selectedExercise] ?? 0;
      return caloriesPerMinute * exerciseDuration;
    } else {
      return 0;
    }
  }
}
