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
          // Slider for height selection
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
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
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
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: kActiveCardColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: kActiveCardColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
