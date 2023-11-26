import 'package:flutter/material.dart';

class ExerciseReps extends StatefulWidget {
  final int maxSets;
  final int maxReps;

  ExerciseReps({required this.maxSets, required this.maxReps});

  @override
  _ExerciseRepsState createState() => _ExerciseRepsState();
}

class _ExerciseRepsState extends State<ExerciseReps> {
  int currentSet = 1;
  int currentRep = 0;

  void incrementRep() {
    setState(() {
      if (currentRep < widget.maxReps) {
        currentRep++;
      } else {
        currentRep = 1;
        currentSet++;
        if (currentSet > widget.maxSets) {
          currentSet = 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Reps'),
      ),
      body: Container(
        color: Colors.white, // Change the background color here
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Set: $currentSet/${widget.maxSets}'),
                    SizedBox(height: 16),
                    Text('Rep: $currentRep/${widget.maxReps}'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => incrementRep(),
                child: Text('Rep Yap'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
