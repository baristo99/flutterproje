import 'package:flutter/material.dart';
import 'bmicalculator.dart';
import 'caloriecalculator.dart';
import 'dailyprotein.dart';

class NutritionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition Page'),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMICalculatorPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[100], // Light green
                  ),
                  icon: Icon(Icons.calculate),
                  label: Text('BMI Calculator'),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalorieCalculatorPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[300], // Medium green
                  ),
                  icon: Icon(Icons.calculate),
                  label: Text('Calorie Calculator'),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DailyProteinCalculatorPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[500], // Dark green
                  ),
                  icon: Icon(Icons.calculate),
                  label: Text('Daily Protein Calculator'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
