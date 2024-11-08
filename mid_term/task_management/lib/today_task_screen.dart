import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'add_task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TodayTaskScreen extends StatefulWidget {
  @override
  _TodayTaskScreenState createState() => _TodayTaskScreenState();
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> toggleTheme(bool isDarkMode) async {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<void> loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool('isDarkMode');
    _themeMode = isDarkMode == true ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class _TodayTaskScreenState extends State<TodayTaskScreen> {
  List<Map<String, dynamic>> _tasks = [];
  Timer? _timer;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _loadTasks();
    _startOverdueCheck();
  }

  Future<void> _initializeNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings =
    InitializationSettings(android: androidSettings);
    await flutterLocalNotificationsPlugin?.initialize(initSettings);
  }

  Future<void> _showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails('channel_id', 'Tasks Channel',
        importance: Importance.max, priority: Priority.high);
    const NotificationDetails generalNotificationDetails =
    NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin?.show(
      0,
      title,
      body,
      generalNotificationDetails,
    );
  }

  Future<void> _loadTasks() async {
    final db = await DatabaseHelper().database;
    List<Map<String, dynamic>> tasks = await db.query(
      'tasks',
      where: 'status = ?',
      whereArgs: ['pending'],
    );

    setState(() {
      _tasks = tasks.where((task) => task['id'] != 0).toList();
    });
  }

  void _startOverdueCheck() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      _checkForOverdueTasks();
    });
  }

  Future<void> _checkForOverdueTasks() async {
    final now = DateTime.now();
    final db = await DatabaseHelper().database;

    for (var task in _tasks) {
      if (task['dueDate'] != null) {
        DateTime dueDate = DateTime.parse(task['dueDate']);
        if (dueDate.isBefore(now) && task['status'] == 'pending') {
          await db.update(
            'tasks',
            {'status': 'completed'},
            where: 'id = ?',
            whereArgs: [task['id']],
          );
          await _showNotification(
            'Task Overdue',
            'Your task "${task['title']}" is now overdue.',
          );
        }
      }
    }

    _loadTasks();
  }

  Future<void> _exportToPDF() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            return pw.Container(
              padding: pw.EdgeInsets.symmetric(vertical: 5),
              child: pw.Text(
                "Title: ${task['title']}\nDescription: ${task['description']}\nDue: ${task['dueDate'] ?? 'N/A'} at ${task['dueTime'] ?? 'N/A'}",
                style: pw.TextStyle(fontSize: 12),
              ),
            );
          },
        ),
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/tasks.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tasks exported to PDF at $path')));
  }

  Future<void> _markTaskAsCompleted(int id) async {
    await DatabaseHelper().markAsCompleted(id);
    _loadTasks();
  }

  void _navigateToAddTaskScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    );
    _loadTasks();
  }

  Future<void> _editTask(Map<String, dynamic> task) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen(task: task)),
    );
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
    final db = await DatabaseHelper().database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
    _loadTasks();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Tasks"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadTasks,
          ),
          IconButton(
            icon: Icon(Icons.download),
            onPressed: _exportToPDF,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                task['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              subtitle: Text(
                '${task['description']}\nDue: ${task['dueDate']} at ${task['dueTime'] ?? 'Time set'}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green),
                    onPressed: () => _editTask(task),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(task['id']),
                  ),
                  IconButton(
                    icon: Icon(Icons.check, color: Colors.blue),
                    onPressed: () => _markTaskAsCompleted(task['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddTaskScreen,
        label: Text("Add Task"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
