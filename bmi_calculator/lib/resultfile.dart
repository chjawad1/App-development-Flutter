import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;

  ResultScreen({required this.bmiResult});

  // Function to interpret BMI value
  String getResult() {
    if (bmiResult >= 25) {
      return "Overweight";
    } else if (bmiResult > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  // Function to get interpretation message
  String getInterpretation() {
    if (bmiResult >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (bmiResult > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You could eat a bit more.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // "Your Result" text
            const Center(
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40.0), // Spacer
            // Result container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Result category (Normal, Overweight, etc.)
                    Text(
                      getResult().toUpperCase(),
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: getResult() == "Normal"
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // BMI value
                    Text(
                      bmiResult.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // Interpretation text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        getInterpretation(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0), // Spacer
            // "Recalculate" button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.all(15.0),
              ),
              child: const Text(
                "RECALCULATE",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
