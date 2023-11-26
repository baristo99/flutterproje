import 'package:flutter/material.dart';

class CalorieCalculatorPage extends StatefulWidget {
  @override
  _CalorieCalculatorPageState createState() => _CalorieCalculatorPageState();
}

class _CalorieCalculatorPageState extends State<CalorieCalculatorPage> {
  TextEditingController proteinController = TextEditingController();
  TextEditingController carbController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  double totalCalories = 0.0;

  void calculateCalories() {
    double protein = double.tryParse(proteinController.text) ?? 0;
    double carb = double.tryParse(carbController.text) ?? 0;
    double fat = double.tryParse(fatController.text) ?? 0;

    double proteinCalories = protein * 4;
    double carbCalories = carb * 4;
    double fatCalories = fat * 9;

    double calories = proteinCalories + carbCalories + fatCalories;

    setState(() {
      totalCalories = calories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Calculator'),
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
                controller: proteinController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Protein (g)',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: carbController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Carbs (g)',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: fatController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Fat (g)',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: calculateCalories,
                child: Text('Calculate Calories'),
              ),
              SizedBox(height: 32.0),
              Text(
                'Total Calories: ${totalCalories.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
