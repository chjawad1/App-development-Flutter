import 'package:flutter/material.dart';
import 'constantfile.dart'; // Import constants file
import 'container_file.dart'; // Import reusable widgets

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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: Colors.pink,
                      overlayColor: Colors.pink.withOpacity(0.2),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 10.0),
                    ),
                    child: Slider(
                      value: height,
                      min: 100.0,
                      max: 220.0,
                      onChanged: (newHeight) {
                        setState(() {
                          height = newHeight;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Left container for Weight
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
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(5.0),
                                backgroundColor: const Color(0xFF4C4F5E),
                              ),
                              child: const Icon(Icons.remove, color: Colors.white),
                            ),
                            const SizedBox(width: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(5.0),
                                backgroundColor: const Color(0xFF4C4F5E),
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Right container for Age
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
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(7.0),
                                backgroundColor: const Color(0xFF4C4F5E),
                              ),
                              child: const Icon(Icons.remove, color: Colors.white),
                            ),
                            const SizedBox(width: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(7.0),
                                backgroundColor: const Color(0xFF4C4F5E),
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
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
          // Additional container at the bottom
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            width: double.infinity,
            height: 60.0,
            color: Colors.pink,
            child: Center(
              child: Text(
                "CALCULATE BMI",
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
