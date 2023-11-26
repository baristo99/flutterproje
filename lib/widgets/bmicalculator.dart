import 'package:flutter/material.dart';

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0.0;
  String bmiStatus = '';

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    if (height == 0) {
      setState(() {
        bmi = 0;
        bmiStatus = '';
      });
      return;
    }

    double bmiValue = weight / ((height / 100) * (height / 100));
    String status = getBMIStatus(bmiValue);

    setState(() {
      bmi = bmiValue;
      bmiStatus = status;
    });
  }

  String getBMIStatus(double bmiValue) {
    if (bmiValue < 18.5) {
      return 'Underweight';
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      return 'Normal Weight';
    } else if (bmiValue >= 25 && bmiValue < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
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
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height (cm)',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: calculateBMI,
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 32.0),
              Text(
                'BMI: ${bmi.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Status: $bmiStatus',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
