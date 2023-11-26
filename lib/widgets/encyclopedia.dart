import 'package:flutter/material.dart';
import 'popup_content.dart';

class EncyclopediaPage extends StatefulWidget {
  @override
  _EncyclopediaPageState createState() => _EncyclopediaPageState();
}

class _EncyclopediaPageState extends State<EncyclopediaPage> {
  List<String> items = [
    'Vitamin A',
    'Vitamin B1',
    'Vitamin B2',
    'Vitamin B3',
    'Vitamin B5',
    'Vitamin B6',
    'Vitamin B7',
    'Vitamin B9',
    'Vitamin B12',
    'Vitamin C',
    'Vitamin D',
    'Vitamin E',
    'Vitamin K',
    'Calcium',
    'Iron',
    'Magnesium',
    'Potassium',
    'Sodium',
    'Zinc',
    'Phosphorus',
    'Iodine',
    'Selenium',
    'Copper',
    'Essential Amino Acids',
    'Essential Fatty Acids',
    'Water',
    'Dietary Fiber',
    'Antioxidants',
    'Probiotics',
  ];

  void _showPopup(String item) {
    String popupContent = PopupContent.itemPopupContent[item] ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pop-up'),
          content: Text(popupContent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encyclopedia'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              _showPopup(items[index]);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.primaries[index %
                  Colors.primaries
                      .length], // Generate a color from the list of primary colors
              onPrimary: Colors.white, // Set the text color to white
            ),
            child: Text(items[index]),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EncyclopediaPage(),
  ));
}
