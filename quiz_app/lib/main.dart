import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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
        scaffoldBackgroundColor: Colors.grey[400],
        primaryColor: Colors.blueAccent,
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
  List<Quiz> _questionBank = [];

  void addQuestion(String questionText, bool answer) {
    _questionBank.add(Quiz(questionText: questionText, answer: answer));
  }

  void editQuestion(int index, String newText, bool newAnswer) {
    if (index >= 0 && index < _questionBank.length) {
      _questionBank[index] = Quiz(questionText: newText, answer: newAnswer);
    }
  }

  List<Quiz> getQuestions() {
    return _questionBank;
  }

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

  int getTotalQuestions() {
    return _questionBank.length;
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with SingleTickerProviderStateMixin {
  final QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];
  int score = 0;
  bool isQuizStarted = false;
  int timer = 10;
  bool isQuizFinished = false;
  bool isButtonDisabled = false;
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  int editIndex = -1; // To track the question being edited

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _offsetAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0.1, 0))
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller);
  }

  void checkAnswer(bool userPickedAnswer) {
    if (isQuizFinished || isButtonDisabled) return;

    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green, size: 30));
        score++;
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red, size: 30));
        shakeAnimation();
      }

      if (quizBrain.isFinished()) {
        isQuizFinished = true;
        showResult();
      } else {
        quizBrain.nextQuestion();
        timer = 10;
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
      score = 0;
      scoreKeeper.clear();
      quizBrain.reset();
      timer = 10;
      isQuizFinished = false;
      isButtonDisabled = false;
      startTimer();
    });
  }

  void startTimer() {
    if (!isQuizFinished) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          if (timer > 0 && !isQuizFinished) {
            timer--;
            startTimer();
          } else if (timer == 0 && !isQuizFinished) {
            checkAnswer(false);
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
          content: Text("Your score is $score/${quizBrain.getTotalQuestions()}", style: TextStyle(fontSize: 18)),
          actions: [
            TextButton(
              child: Text("Restart", style: TextStyle(color: Colors.green)),
              onPressed: () {
                setState(() {
                  quizBrain.reset();
                  scoreKeeper.clear();
                  score = 0;
                  timer = 10;
                  isQuizStarted = false;
                  isQuizFinished = false;
                  isButtonDisabled = false;
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void editQuestion(int index) {
    setState(() {
      editIndex = index;
      questionController.text = quizBrain.getQuestions()[index].questionText;
      answerController.text = quizBrain.getQuestions()[index].answer.toString();
    });
  }

  void showQuestions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Added Questions"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: quizBrain.getQuestions().length,
              itemBuilder: (context, index) {
                final question = quizBrain.getQuestions()[index];
                return ListTile(
                  title: Text(question.questionText),
                  subtitle: Text('Answer: ${question.answer}'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      editQuestion(index);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text("Close", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.pop(context);
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
        title: Text('Customizable Quiz App'),
        centerTitle: true,
      ),
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
              style: TextStyle(fontSize: 20.0, color: Colors.black),
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
                        backgroundColor: Colors.lightGreen,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      child: Text('True', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                      onPressed: () {
                        checkAnswer(true);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      child: Text('False', style: TextStyle(fontSize: 20.0, color: Colors.white)),
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
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                hintText: 'Enter Question',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                hintText: 'Enter Answer (true/false)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                bool answer = answerController.text.toLowerCase() == 'true';
                if (editIndex == -1) {
                  quizBrain.addQuestion(questionController.text, answer);
                } else {
                  quizBrain.editQuestion(editIndex, questionController.text, answer);
                  editIndex = -1;
                }
                questionController.clear();
                answerController.clear();
              },
              child: Text(editIndex == -1 ? 'Add Question' : 'Save Changes'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: showQuestions,
              child: Text('Show Added Questions'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: startQuiz,
              child: Text('Start Quiz'),
            ),
          ],
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
