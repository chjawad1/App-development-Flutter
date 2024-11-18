import 'package:flutter/material.dart';

/// Enum for Gender with added clarity
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  final Color activeColor = Color(0xFF1D1E33);
  final Color inactiveColor = Color(0xFF111328);

  
  Color getGenderColor(Gender gender) {
    return selectedGender == gender ? activeColor : inactiveColor;
  }


  IconData genderToIcon(Gender gender) {
    return gender == Gender.male ? Icons.male : Icons.female;
  }
  String genderToLabel(Gender gender) {
    return gender == Gender.male ? "MALE" : "FEMALE";
  }


  Widget buildGenderCard(Gender gender) {
    return RepeatContainerCode(
      colors: getGenderColor(gender),
      onPressed: () {
        setState(() {
          selectedGender = gender;
        });
      },
      cardWidget: CardWidget(
        iconData: genderToIcon(gender),
        label: genderToLabel(gender),
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
          color: isActive ? Colors.blueAccent : Colors.white,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: isActive ? Colors.blueAccent : Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
