import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class AddTaskScreen extends StatefulWidget {
  final Map<String, dynamic>? task; // Optional parameter for editing

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

    // If editing, initialize fields with existing task details
    if (widget.task != null) {
      _titleController.text = widget.task!['title'];
      _descriptionController.text = widget.task!['description'];
      _dueDate = DateTime.tryParse(widget.task!['dueDate'] ?? '');
      _isRepeated = widget.task!['isRepeated'] == 1;
      if (_dueDate != null) {
        _dueTime = TimeOfDay.fromDateTime(_dueDate!);
      }
    }
  }

  Future<void> _addOrUpdateTask() async {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a task title")),
      );
      return;
    }

    DateTime? dueDateTime;
    if (_dueDate != null && _dueTime != null) {
      dueDateTime = DateTime(
        _dueDate!.year,
        _dueDate!.month,
        _dueDate!.day,
        _dueTime!.hour,
        _dueTime!.minute,
      );
    }

    final db = await DatabaseHelper().database;
    final taskData = {
      'title': _titleController.text,
      'description': _descriptionController.text,
      'dueDate': dueDateTime != null ? dueDateTime.toIso8601String() : null,
      'status': 'pending',
      'isRepeated': _isRepeated ? 1 : 0,
    };

    if (widget.task == null) {
      // Insert new task
      await db.insert('tasks', taskData);
    } else {
      // Update existing task
      await db.update(
        'tasks',
        taskData,
        where: 'id = ?',
        whereArgs: [widget.task!['id']],
      );
    }

    Navigator.pop(context); // Close screen after task is added or updated
  }

  Future<void> _pickDate() async {
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
  }

  Future<void> _pickTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        _dueTime = selectedTime;
      });
    }
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
              subtitle: Text(
                _dueDate != null ? DateFormat.yMd().format(_dueDate!) : 'Not Set',
              ),
              onTap: _pickDate,
            ),
            ListTile(
              title: Text('Due Time'),
              subtitle: Text(
                _dueTime != null ? _dueTime!.format(context) : 'Not Set',
              ),
              onTap: _pickTime,
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
