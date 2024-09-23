import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange, // Top header primary color
      ),
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _diceNumber1 = 0;
  int _diceNumber2 = 0;
  int _diceNumber3 = 0;
  int _diceNumber4 = 0;

  // Functions to roll each dice individually
  void _rollDice1() {
    setState(() {
      _diceNumber1 = Random().nextInt(6) + 1;
    });
  }

  void _rollDice2() {
    setState(() {
      _diceNumber2 = Random().nextInt(6) + 1;
    });
  }

  void _rollDice3() {
    setState(() {
      _diceNumber3 = Random().nextInt(6) + 1;
    });
  }

  void _rollDice4() {
    setState(() {
      _diceNumber4 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
        backgroundColor: Colors.deepOrangeAccent, // Custom header color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Row for Dice 1 and 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Dice 1: $_diceNumber1',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'images/dice-$_diceNumber1.png',
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _rollDice1,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Button background color
                        foregroundColor: Colors.white, // Button text color
                      ),
                      child: Text('Roll Dice 1'),
                    ),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      'Dice 2: $_diceNumber2',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'images/dice-$_diceNumber2.png',
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _rollDice2,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button background color
                        foregroundColor: Colors.white, // Button text color
                      ),
                      child: Text('Roll Dice 2'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),

            // Second Row for Dice 3 and 4
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Dice 3: $_diceNumber3',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'images/dice-$_diceNumber3.png',
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _rollDice3,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // Button background color
                        foregroundColor: Colors.white, // Button text color
                      ),
                      child: Text('Roll Dice 3'),
                    ),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      'Dice 4: $_diceNumber4',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'images/dice-$_diceNumber4.png',
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _rollDice4,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button background color
                        foregroundColor: Colors.white, // Button text color
                      ),
                      child: Text('Roll Dice 4'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
