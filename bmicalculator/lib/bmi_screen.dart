import 'dart:math';

import 'package:bmicalculator/bmi_result_Screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height = 180.0; // Variable to store the slider's height value
  double weight = 45;
  int age = 20;
  bool isMale = true;
  Color maleColor = Colors.grey;
  Color femaleColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          // Gender Selection
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                          maleColor = Colors.blue;
                          femaleColor = Colors.grey;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: maleColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.male, size: 80),
                            SizedBox(height: 20),
                            Text("MALE"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                          maleColor = Colors.grey;
                          femaleColor = Colors.pink;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: femaleColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.female, size: 80),
                            SizedBox(height: 20),
                            Text("FEMALE"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Height Selection
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HEIGHT",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.round().toString(),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "CM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Slider(
                  value: height,
                  max: 220.0,
                  min: 80.0,
                  onChanged: (value) {
                    setState(() {
                      height = value; // Update the height dynamically
                    });
                  },
                ),
              ],
            ),
          ),

          // Action Buttons
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // First Row of FloatingActionButtons
                    Column(
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          age.round().toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(Icons.remove), // Example icon
                            ),
                            const SizedBox(width: 10), // Optional spacing
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add), // Example icon
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          weight.round().toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(Icons.remove), // Example icon
                            ),
                            const SizedBox(width: 10), // Optional spacing
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(Icons.add), // Example icon
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16.0),
            // color: Colors.blue,

            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                print('Weight: $weight, Height: $height meters, BMI: $result');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BmiResultScreen(
                            age: age,
                            isMale: isMale,
                            result: result.roundToDouble())));
              },
              height: 50.0,
              child: Text(
                'CALCULATE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // child:  Text(
            //   "Calculate",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            // ),
          ),
        ],
      ),
    );
  }
}
