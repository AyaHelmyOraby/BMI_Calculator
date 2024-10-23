import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;

  // Constructor to initialize the fields
  BmiResultScreen({
    Key? key,
    required this.result, // Mark as required for non-nullable values
    required this.age,
    required this.isMale,
  }) : super(key: key);


   String getBmiCategory() {
    if (result < 18.5) {
      return "Underweight";
    } else if (result >= 18.5 && result < 24.9) {
      return "Normal weight";
    } else if (result >= 25 && result < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left
            ),
          ),
          title: Text(
            "BMI Result",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Result : $result : ${getBmiCategory()}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Age : $age",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
