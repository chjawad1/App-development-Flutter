import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'today_task_screen.dart';
import 'completed_task_screen.dart';
import 'repeated_task_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initializeNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeNotification();
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('themeMode') ?? 'system';
    setState(() {
      _themeMode = theme == 'dark'
          ? ThemeMode.dark
          : theme == 'light'
          ? ThemeMode.light
          : ThemeMode.system;
    });
  }

  Future<void> _setThemePreference(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', theme);
  }

  void _toggleTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
    _setThemePreference(mode == ThemeMode.dark ? 'dark' : 'light');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: _themeMode,
      home: MainScreen(
        toggleTheme: _toggleTheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(ThemeMode) toggleTheme;

  MainScreen({required this.toggleTheme});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    TodayTaskScreen(),
    CompletedTaskScreen(),
    RepeatedTaskScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              ThemeMode newMode = Theme.of(context).brightness == Brightness.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
              widget.toggleTheme(newMode);
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.repeat),
            label: 'Repeated',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
