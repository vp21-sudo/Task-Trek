import 'package:to_do_app/db/dbhelper.dart';
import 'package:to_do_app/db/task_model.dart';

class TaskOperations {
  static Future<int> addTask(Task task) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('tasks', task.toMap());
  }

  static Future<List<Task>> getTasks() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  static Future<int> updateTask(Task task) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  static Future<void> deleteTask(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
