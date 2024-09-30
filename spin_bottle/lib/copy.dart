import 'package:flutter/material.dart';

void main() {
  runApp(SpinTheBottleApp());
}

class SpinTheBottleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spin the Bottle Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayerInputScreen(),
    );
  }
}

// Screen to input player names and select a bottle
class PlayerInputScreen extends StatefulWidget {
  @override
  _PlayerInputScreenState createState() => _PlayerInputScreenState();
}

class _PlayerInputScreenState extends State<PlayerInputScreen> {
  List<String> playerNames = [];
  final int maxPlayers = 10;
  final TextEditingController nameController = TextEditingController();

  // List of available bottles
  List<String> bottleImages = [
    'assets/images/bottle1.png',
    'assets/images/bottle2.png',
    'assets/images/bottle3.png',
  ];

  // Track selected bottle
  String? selectedBottle;

  void addPlayer() {
    if (playerNames.length < maxPlayers && nameController.text.isNotEmpty) {
      setState(() {
        playerNames.add(nameController.text);
      });
      nameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Player Names')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Player Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addPlayer,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: playerNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(playerNames[index]),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text('Select a Bottle'),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bottleImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBottle = bottleImages[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      bottleImages[index],
                      width: 80,
                      height: 80,
                      color: selectedBottle == bottleImages[index]
                          ? Colors.blue
                          : null, // Highlight selected bottle
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: playerNames.isNotEmpty && selectedBottle != null
                ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BottleSpinScreen(players: playerNames, selectedBottle: selectedBottle!),
                ),
              );
            }
                : null,
            child: Text('Start Game'),
          ),
        ],
      ),
    );
  }
}

// Screen to spin the bottle
class BottleSpinScreen extends StatefulWidget {
  final List<String> players;
  final String selectedBottle;

  BottleSpinScreen({required this.players, required this.selectedBottle});

  @override
  _BottleSpinScreenState createState() => _BottleSpinScreenState();
}

class _BottleSpinScreenState extends State<BottleSpinScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _angle = 0;
  bool _isSpinning = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  void spinBottle() {
    setState(() {
      _isSpinning = true;
      _angle = (360 * 5) + (360 * (widget.players.length) * (1 + (DateTime.now().millisecond % 360) / 360));
    });

    _controller.forward(from: 0).then((_) {
      setState(() {
        _isSpinning = false;
        int selectedPlayer = (widget.players.length * ((_angle % 360) / 360)).floor();
        showChallenge(widget.players[selectedPlayer]);
      });
    });
  }

  void showChallenge(String playerName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChallengeScreen(playerName: playerName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spin the Bottle')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: _isSpinning ? null : spinBottle,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * _angle,
                  child: Image.asset(widget.selectedBottle, width: 200, height: 200),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Screen to show challenges
class ChallengeScreen extends StatefulWidget {
  final String playerName;

  ChallengeScreen({required this.playerName});

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  List<String> customChallenges = [];
  TextEditingController challengeController = TextEditingController();

  List<String> predefinedChallenges = [
    "Dance for 30 seconds",
    "Sing a song",
    "Do 10 push-ups",
    "Tell an embarrassing story",
    "Do an impression of someone",
  ];

  void addCustomChallenge() {
    if (challengeController.text.isNotEmpty) {
      setState(() {
        customChallenges.add(challengeController.text);
      });
      challengeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> allChallenges = [...predefinedChallenges, ...customChallenges];
    String randomChallenge = (allChallenges..shuffle()).first;

    return Scaffold(
      appBar: AppBar(title: Text('Challenge for ${widget.playerName}')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Your Challenge:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              randomChallenge,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: challengeController,
              decoration: InputDecoration(
                labelText: 'Add your own challenge',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addCustomChallenge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
