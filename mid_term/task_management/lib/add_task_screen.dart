import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart';
import 'package:timezone/timezone.dart' as tz;

class AddTaskScreen extends StatefulWidget {
  final Map<String, dynamic>? task;

  AddTaskScreen({this.task});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _dueDate;
  TimeOfDay? _dueTime;
  bool _isRepeated = false;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!['title'];
      _descriptionController.text = widget.task!['description'];
      _dueDate = DateTime.parse(widget.task!['dueDate']);
      _isRepeated = widget.task!['isRepeated'] == 1;
      _dueTime = TimeOfDay(
          hour: _dueDate!.hour,
          minute: _dueDate!.minute,);
    }
  }

  Future<void> _addOrUpdateTask() async {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a task title")),
      );
      return;
    }
    final db = await DatabaseHelper().database;
    // Combine the selected due date and time into a single DateTime object
    DateTime? combinedDateTime;
    if (_dueDate != null && _dueTime != null) {
      combinedDateTime = DateTime(
        _dueDate!.year,
        _dueDate!.month,
        _dueDate!.day,
        _dueTime!.hour,
        _dueTime!.minute,
      );
    }


    final taskData = {
      'title': _titleController.text,
      'description': _descriptionController.text,
      'dueDate': combinedDateTime?.toString(),

      'status': 'pending',
      'isRepeated': _isRepeated ? 1 : 0,
    };

    if (widget.task != null) {
      await db.update('tasks', taskData, where: 'id = ?', whereArgs: [widget.task!['id']]);
      await showNotification("Task Updated", "The task '${_titleController.text}' was updated.");
    } else {
      await db.insert('tasks', taskData);
      await showNotification("Task Added", "The task '${_titleController.text}' was added.");
    }

    // Schedule notification only if both due date and time are selected
    if (combinedDateTime != null) {
      await _scheduleNotification(
        combinedDateTime,
        _titleController.text,
        "Task is due on ${DateFormat.yMd().add_jm().format(combinedDateTime)}",
      );
    } else {
      await showNotification(_titleController.text, "Task added successfully");
    }

    Navigator.pop(context);
  }

  Future<void> _scheduleNotification(DateTime combinedDateTime, String title, String body) async {
    var androidDetails = AndroidNotificationDetails(
      'task_channel',
      'Task Notifications',
      channelDescription: 'Notifications for tasks due today',
      importance: Importance.high,
      priority: Priority.high,
    );
    var notificationDetails = NotificationDetails(android: androidDetails);

    // Convert to TZDateTime
    tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(combinedDateTime, tz.local);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // Notification ID
      title,
      body,
      tzScheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'task_channel',
      'Task Notifications',
      channelDescription: 'Notifications for tasks',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      platformDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.task == null ? 'Add Task' : 'Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ListTile(
              title: Text('Due Date'),
              subtitle: Text(_dueDate != null ? DateFormat.yMd().format(_dueDate!) : 'Not Set'),
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  setState(() {
                    _dueDate = selectedDate;
                  });
                }
              },
            ),
            ListTile(
              title: Text('Due Time'),
              subtitle: Text(_dueTime != null ? _dueTime!.format(context) : 'Not Set'),
              onTap: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  setState(() {
                    _dueTime = selectedTime;
                  });
                }
              },
            ),
            CheckboxListTile(
              title: Text("Repeat Task"),
              value: _isRepeated,
              onChanged: (bool? value) {
                setState(() {
                  _isRepeated = value ?? false;
                });
              },
            ),
            ElevatedButton(
              onPressed: _addOrUpdateTask,
              child: Text(widget.task == null ? 'Add Task' : 'Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}
