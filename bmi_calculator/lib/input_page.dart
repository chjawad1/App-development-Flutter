import 'package:flutter/material.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;

  final Color activeColor = Color(0xFF1D1E33);
  final Color deActiveColor = Color(0xFF111328);
  final TextStyle labelStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98),
  );

  /// Returns the color based on gender selection
  Color getColor(Gender gender) {
    return selectGender == gender ? activeColor : deActiveColor;
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
                    colors: getColor(Gender.male),
                    onPressed: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    cardWidget: CardWidget(
                      iconData: Icons.male,
                      label: "MALE",
                      isActive: selectGender == Gender.male,
                    ),
                  ),
                ),
                Expanded(
                  child: RepeatContainerCode(
                    colors: getColor(Gender.female),
                    onPressed: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    cardWidget: CardWidget(
                      iconData: Icons.female,
                      label: "FEMALE",
                      isActive: selectGender == Gender.female,
                    ),
                  ),
                ),
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
