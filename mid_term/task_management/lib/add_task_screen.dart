import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _dueDate;
  bool _isRepeated = false;

  Future<void> _addTask() async {
    final db = await DatabaseHelper().database;
    await db.insert('tasks', {
      'title': _titleController.text,
      'description': _descriptionController.text,
      'dueDate': _dueDate != null ? _dueDate.toString() : null,
      'status': 'pending',
      'isRepeated': _isRepeated ? 1 : 0,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
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
              onPressed: _addTask,
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
