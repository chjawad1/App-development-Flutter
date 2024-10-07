import 'package:flutter/material.dart';
import 'package:flutter/animation.dart'; // For animations

QuizBrain quizBrain = QuizBrain();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: QuizPage(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey, // Light background
        primaryColor: Colors.blueGrey, // Theme accent color
      ),
    );
  }
}

class Quiz {
  String questionText;
  bool answer;
  Quiz({required this.questionText, required this.answer});
}

class QuizBrain {
  int _questionIndex = 0;
  List<Quiz> _questionBank = [
    Quiz(questionText: 'Flutter is a framework?', answer: true),
    Quiz(questionText: 'Flutter uses Dart language?', answer: true),
    Quiz(questionText: 'The capital of France is Berlin?', answer: false),
    Quiz(questionText: 'The square root of 64 is 8?', answer: true),
    Quiz(questionText: 'Mount Everest is the highest mountain in the world?', answer: true),
    Quiz(questionText: 'The human body has four lungs?', answer: false),
    Quiz(questionText: 'Sharks are mammals?', answer: false),
    Quiz(questionText: 'The Great Wall of China is visible from space?', answer: false),
    Quiz(questionText: 'Lightning never strikes in the same place twice?', answer: false),
    Quiz(questionText: 'Sound travels faster than light?', answer: false),
  ];

  String getQuestion() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionIndex].answer;
  }

  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }

  bool isFinished() {
    return _questionIndex >= _questionBank.length - 1;
  }

  void reset() {
    _questionIndex = 0;
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with SingleTickerProviderStateMixin {
  List<Icon> scoreKeeper = [];
  int score = 0;
  bool isQuizStarted = false;
  int timer = 5;
  bool isQuizFinished = false; // To prevent score update after quiz finishes
  bool isButtonDisabled = false; // To disable buttons once quiz is done

  // Animation variables
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _offsetAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0.1, 0))
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller);
  }

  void checkAnswer(bool userPickedAnswer) {
    if (isQuizFinished || isButtonDisabled) return; // Prevent further interaction if quiz is finished

    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green, size: 30));
        score++;
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red, size: 30));
        shakeAnimation(); // Trigger shake animation for wrong answers
      }

      if (quizBrain.isFinished()) {
        isQuizFinished = true;
        showResult();
      } else {
        quizBrain.nextQuestion();
        timer = 5;
        startTimer();
      }
    });
  }

  void shakeAnimation() {
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  void startQuiz() {
    setState(() {
      isQuizStarted = true;
      score = 0; // Reset score
      scoreKeeper.clear(); // Clear previous score icons
      quizBrain.reset(); // Reset quiz
      timer = 5; // Reset timer
      isQuizFinished = false; // Reset quiz finished flag
      isButtonDisabled = false; // Enable buttons again
      startTimer(); // Start timer
    });
  }

  void startTimer() {
    if (!isQuizFinished) { // Ensure timer doesn't run after quiz is over
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          if (timer > 0 && !isQuizFinished) {
            timer--;
            startTimer();
          } else if (timer == 0 && !isQuizFinished) {
            checkAnswer(false); // Timeout, move to next question
          }
        });
      });
    }
  }

  void showResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Quiz Completed!", style: TextStyle(color: Colors.blueAccent)),
          content: Text("Your score is $score/10", style: TextStyle(fontSize: 18)),
          actions: [
            TextButton(
              child: Text("Restart", style: TextStyle(color: Colors.green)),
              onPressed: () {
                setState(() {
                  quizBrain.reset();
                  scoreKeeper.clear();
                  score = 0;
                  timer = 5;
                  isQuizStarted = false;
                  isQuizFinished = false; // Reset flag
                  isButtonDisabled = false; // Re-enable buttons
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true, // Align the title to the center
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: isQuizStarted
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Time Left: $timer seconds',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Expanded(
              child: Center(
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen, // Updated color parameter
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      child: Text(
                        'True',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: () {
                        checkAnswer(true);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent, // Updated color parameter
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      child: Text(
                        'False',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: scoreKeeper,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )
            : Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Updated color parameter
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: startQuiz,
            child: Text(
              'Start Quiz',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
