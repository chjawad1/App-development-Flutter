import 'package:flutter/material.dart';
import 'container_file.dart';
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

  // Function object to handle gender selection and state updates
  void Function()? onGenderTap(Gender gender) {
    return () {
      setState(() {
        selectedGender = gender;
      });
    };
  }


  Color getGenderColor(Gender gender) =>
      selectedGender == gender ? activeColor : inactiveColor;

  Widget buildGenderCard(Gender gender) {
    return RepeatContainerCode(
      colors: getGenderColor(gender), // Determines card color
      onPressed: onGenderTap(gender), // Handles tap functionality
      cardWidget: CardWidget(
        iconData: gender == Gender.male ? Icons.male : Icons.female,
        label: gender == Gender.male ? "MALE" : "FEMALE",
        isActive: selectedGender == gender,
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
          color: isActive ? Colors.blueAccent : Colors.white, // Active color
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: isActive ? Colors.blueAccent : Color(0xFF8D8E98), // Active label color
          ),
        ),
      ],
    );
  }
}
