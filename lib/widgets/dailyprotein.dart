import 'package:flutter/material.dart';

class DailyProteinCalculatorPage extends StatefulWidget {
  @override
  _DailyProteinCalculatorPageState createState() =>
      _DailyProteinCalculatorPageState();
}

class _DailyProteinCalculatorPageState
    extends State<DailyProteinCalculatorPage> {
  TextEditingController weightController = TextEditingController();
  double dailyProteinMin = 0.0;
  double dailyProteinMax = 0.0;

  void calculateDailyProtein() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double proteinMin = weight * 0.8;
    double proteinMax = weight * 1.6;

    setState(() {
      dailyProteinMin = proteinMin;
      dailyProteinMax = proteinMax;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Protein Calculator'),
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
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: calculateDailyProtein,
                child: Text('Calculate Daily Protein'),
              ),
              SizedBox(height: 32.0),
              Text(
                'Daily Protein Needs:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Minimum: ${dailyProteinMin.toStringAsFixed(2)} grams',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                'Maximum: ${dailyProteinMax.toStringAsFixed(2)} grams',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
