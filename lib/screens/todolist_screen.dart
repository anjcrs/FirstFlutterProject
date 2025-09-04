import 'package:flutter/material.dart';
import '../widgets/tdl_item.dart';
import '../widgets/tdl_inputs.dart';

class TodoItem {
  String task;
  bool isCompleted;

  TodoItem({required this.task, this.isCompleted = false});
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<TodoItem> _todoItems = [];

  // Color constants
  static const Color navyBlue = Color(0xFF1B2951);
  static const Color lightNavy = Color(0xFF2D4A73);
  static const Color gold = Color(0xFFD4AF37);

  void _addTask(String task) {
    if (task.trim().isNotEmpty) {
      setState(() {
        _todoItems.add(TodoItem(task: task.trim()));
      });
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _todoItems[index].isCompleted = !_todoItems[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  void _clearCompleted() {
    setState(() {
      _todoItems.removeWhere((item) => item.isCompleted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navyBlue,
      appBar: AppBar(
        title: Text(
          'Your To-Do List App',
          style: TextStyle(
            color: gold,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: navyBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Add Task Section
          TaskInput(onAddTask: _addTask),

          // Task Counter
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Tasks: ${_todoItems.length}',
                  style: TextStyle(
                    color: gold,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  'Completed: ${_todoItems.where((item) => item.isCompleted).length}',
                  style: TextStyle(
                    color: gold.withOpacity(0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Task List
          Expanded(
            child: _todoItems.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.checklist_outlined,
                    size: 64,
                    color: gold.withOpacity(0.5),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No tasks yet!',
                    style: TextStyle(
                      color: gold.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Add a task to get started',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.only(bottom: 16),
              itemCount: _todoItems.length,
              itemBuilder: (context, index) {
                return TodoItemWidget(
                  item: _todoItems[index],
                  onToggle: () => _toggleTask(index),
                  onDelete: () => _deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),

      // Clear Completed Tasks Button
      floatingActionButton: _todoItems.any((item) => item.isCompleted)
          ? FloatingActionButton.extended(
        onPressed: _clearCompleted,
        backgroundColor: gold,
        foregroundColor: navyBlue,
        icon: Icon(Icons.clear_all),
        label: Text(
          'Clear Completed',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )
          : null,
    );
  }
}