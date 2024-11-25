import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;

  ResultScreen({required this.bmiResult});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your BMI is",
            style: TextStyle(fontSize: 22.0, color: Colors.grey),
          ),

        ],
      ),
    );
  }
}
