import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: repeatcontainercode(
                    colors: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: repeatcontainercode(colors: Color(0xFF1D1E33),),
                ),
              ],
            ),
          ),
          Expanded(
            child: repeatcontainercode(colors: Color(0xFF1D1E33),),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: repeatcontainercode(colors: Colors.blue),
                ),
                Expanded(
                  child: repeatcontainercode(colors: Color(0xFF1D1E33),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class repeatcontainercode extends StatelessWidget {
  repeatcontainercode({required this.colors});
 final Color colors;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10.0)

      ),
    );
  }
}
