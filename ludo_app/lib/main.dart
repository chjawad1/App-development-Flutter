import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: DiceGameScreen(),
    );
  }
}

class DiceGameScreen extends StatefulWidget {
  @override
  _DiceGameScreenState createState() => _DiceGameScreenState();
}

class _DiceGameScreenState extends State<DiceGameScreen> {
  final int _totalRounds = 10; // Total number of rounds
  int _currentRound = 1;
  int _currentPlayer = 1;
  List<int> _scores = [0, 0, 0, 0]; // Scores for each player
  int _diceNumber = 1;
  bool _gameOver = false;

  // Function to roll the dice for the current player
  void _rollDice() {
    setState(() {
      _diceNumber = Random().nextInt(6) + 1;
      _scores[_currentPlayer - 1] += _diceNumber;

      // Move to the next player
      if (_currentPlayer == 4) {
        _currentPlayer = 1;
        _currentRound++;
      } else {
        _currentPlayer++;
      }

      // Check if the game is over
      if (_currentRound > _totalRounds) {
        _gameOver = true;
        _showWinnerDialog();
      }
    });
  }

  // Function to display the winner dialog
  void _showWinnerDialog() {
    int highestScore = _scores.reduce(max);
    int winner = _scores.indexOf(highestScore) + 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('Player $winner wins with a score of $highestScore!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  // Function to reset the game
  void _resetGame() {
    setState(() {
      _currentRound = 1;
      _currentPlayer = 1;
      _scores = [0, 0, 0, 0];
      _diceNumber = 1;
      _gameOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4 Player Dice Roller'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display current round and player
            if (!_gameOver)
              Text(
                'Round $_currentRound / $_totalRounds',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20),

            Text(
              _gameOver
                  ? 'Game Over'
                  : 'Player $_currentPlayer\'s Turn',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Display dice roll result
            Image.asset(
              'images/dice-$_diceNumber.png',
              height: 150,
            ),
            SizedBox(height: 20),

            // Roll dice button
            ElevatedButton(
              onPressed: _gameOver ? null : _rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                'Roll Dice',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 40),

            // Display player scores
            for (int i = 0; i < 4; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player ${i + 1}: ${_scores[i]}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
