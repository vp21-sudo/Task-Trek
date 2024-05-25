import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_app/components/create_task_dialog.dart';
import 'package:to_do_app/components/to_do_tile.dart';
import 'package:to_do_app/db/db_crud.dart';
import 'package:to_do_app/db/task_model.dart'; // Import your Task model and operations

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> toDo = []; // This will now hold Task objects

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshTasks(); // Load tasks from the database on init
  }

  Future<void> createTask() async {
    var newTask = Task(
      id: Random.secure().nextInt(32000), // Auto-incremented
      taskName: _controller.text,
      completed: false,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    await TaskOperations.addTask(newTask);
    refreshTasks(); // Refresh list after adding
    _controller.text = '';
    Navigator.of(context).pop();
  }

  void checkBoxChecked(bool? value, int index) async {
    var task = toDo[index];
    task.completed = value ?? false;
    task.updatedAt = DateTime.now().toIso8601String();
    await TaskOperations.updateTask(task);
    refreshTasks(); // Refresh list after update
  }

  Future<void> refreshTasks() async {
    toDo = await TaskOperations.getTasks();
    setState(() {}); // Update UI
  }

  void deleteTask(int index) async {
    await TaskOperations.deleteTask(toDo[index].id);
    refreshTasks(); // Refresh list after deletion
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            textInpController: _controller,
            onSave: createTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        title: const Text("Task Trek"),
        toolbarHeight: 75,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 32,
        ),
      ),
      body: ListView.builder(
        itemCount: toDo.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: toDo[index].taskName,
          taskCompleted: toDo[index].completed,
          onChange: (value) => checkBoxChecked(value, index),
          deleteFunction: (ztx) => deleteTask(index),
        ),
      ),
    );
  }
}
