import 'package:flutter/material.dart';
import 'constantfile.dart'; // Import constants file
import 'container_file.dart'; // Import reusable widgets
import 'resultfile.dart'; // Import result screen

/// Enum for Gender
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  double height = 170.0; // Default height value in cm
  int weight = 60; // Default weight value in kg
  int age = 25; // Default age value in years

  // Function to calculate BMI
  double calculateBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  // Function object for handling gender selection
  void Function()? onGenderTap(Gender gender) {
    return () {
      setState(() {
        selectedGender = gender;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          // Gender selection row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RepeatContainerCode(
                    colors: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPressed: onGenderTap(Gender.male),
                    cardWidget: CardWidget(
                      iconData: Icons.male,
                      label: "MALE",
                      isActive: selectedGender == Gender.male,
                    ),
                  ),
                ),
                Expanded(
                  child: RepeatContainerCode(
                    colors: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPressed: onGenderTap(Gender.female),
                    cardWidget: CardWidget(
                      iconData: Icons.female,
                      label: "FEMALE",
                      isActive: selectedGender == Gender.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Height slider section
          Expanded(
            child: RepeatContainerCode(
              colors: kActiveCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        " cm",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 100.0,
                    max: 220.0,
                    onChanged: (newHeight) {
                      setState(() {
                        height = newHeight;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Weight and Age row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RepeatContainerCode(
                    colors: kActiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          "$weight",
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RepeatContainerCode(
                    colors: kActiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          "$age",
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Calculate BMI button
          GestureDetector(
            onTap: () {
              double bmi = calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(bmiResult: bmi),
                ),
              );
            },
            child: Container(
              color: Colors.pink,
              height: 60.0,
              width: double.infinity,
              child: const Center(
                child: Text(
                  "CALCULATE BMI",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
