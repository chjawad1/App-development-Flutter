import 'package:flutter/material.dart';

/// Enum for Gender
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender; // Holds the currently selected gender

  final Color activeColor = Color(0xFF1D1E33);
  final Color inactiveColor = Color(0xFF111328);

  /// Uses ternary operator to determine the appropriate color
  Color getGenderColor(Gender gender) =>
      selectedGender == gender ? activeColor : inactiveColor;

  /// Maps Gender enum to corresponding icons using ternary operator
  IconData genderToIcon(Gender gender) =>
      gender == Gender.male ? Icons.male : Icons.female;

  /// Maps Gender enum to corresponding labels using ternary operator
  String genderToLabel(Gender gender) =>
      gender == Gender.male ? "MALE" : "FEMALE";

  /// Builds a gender selection card using the above utilities
  Widget buildGenderCard(Gender gender) {
    return RepeatContainerCode(
      colors: getGenderColor(gender), // Determines card color
      onPressed: () {
        setState(() {
          selectedGender = gender; // Updates selected gender
        });
      },
      cardWidget: CardWidget(
        iconData: genderToIcon(gender), // Icon mapped using ternary
        label: genderToLabel(gender),  // Label mapped using ternary
        isActive: selectedGender == gender, // Activates based on selection
      ),
    );
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
                Expanded(child: buildGenderCard(Gender.male)),
                Expanded(child: buildGenderCard(Gender.female)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
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

/// Reusable container widget for gender cards
class RepeatContainerCode extends StatelessWidget {
  const RepeatContainerCode({
    required this.colors,
    this.cardWidget,
    this.onPressed,
  });

  final Color colors;
  final Widget? cardWidget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardWidget,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

/// Card widget for gender selection
class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.iconData,
    required this.label,
    required this.isActive,
  });

  final IconData iconData;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
          color: isActive ? Colors.blueAccent : Colors.white, // Ternary for color
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: isActive ? Colors.blueAccent : Color(0xFF8D8E98), // Ternary for text color
          ),
        ),
      ],
    );
  }
}
