import 'package:flutter/material.dart';

class ProgressTracker extends StatefulWidget {
  @override
  _ProgressTrackerState createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {
  int currentStep = 0;
  int totalSteps = 0;
  TextEditingController _totalStepsController = TextEditingController();

  void updateStep() {
    setState(() {
      currentStep += 1;
    });
  }

  @override
  void dispose() {
    _totalStepsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _totalStepsController,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              totalSteps = int.tryParse(value) ?? 0;
            });
          },
          decoration: InputDecoration(
            labelText: 'Total Steps',
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Current Step: $currentStep',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            updateStep();
          },
          child: Text('Next Step'),
        ),
      ],
    );
  }
}
