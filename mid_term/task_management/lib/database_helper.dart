import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            dueDate TEXT,
            status TEXT,
            repeatDaily INTEGER,         -- 1 if task is set to repeat daily, 0 otherwise
            selectedDays TEXT             -- Comma-separated days if task repeats on specific days (e.g., "Mon,Wed,Fri")
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute("ALTER TABLE tasks ADD COLUMN repeatDaily INTEGER DEFAULT 0");
          await db.execute("ALTER TABLE tasks ADD COLUMN selectedDays TEXT");
        }
      },
    );
  }

  Future<void> insertTask(Map<String, dynamic> task) async {
    final db = await database;
    await db.insert('tasks', task);
  }

  Future<List<Map<String, dynamic>>> getTasks(String status) async {
    final db = await database;
    return await db.query('tasks', where: 'status = ?', whereArgs: [status]);
  }

  Future<List<Map<String, dynamic>>> getRepeatedTasks() async {
    final db = await database;
    return await db.query(
      'tasks',
      where: 'repeatDaily = 1 OR selectedDays IS NOT NULL',
    );
  }

  Future<void> updateTask(int id, Map<String, dynamic> task) async {
    final db = await database;
    await db.update('tasks', task, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> markAsCompleted(int id) async {
    final db = await database;
    await db.update(
      'tasks',
      {'status': 'completed'},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
