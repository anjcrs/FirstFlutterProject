import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final Function(String) onAddTask;

  const TaskInput({Key? key, required this.onAddTask}) : super(key: key);

  @override
  _TaskInputState createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();

  // Color constants
  static const Color navyBlue = Color(0xFF1B2951);
  static const Color lightNavy = Color(0xFF2D4A73);
  static const Color gold = Color(0xFFD4AF37);

  void _addTask() {
    widget.onAddTask(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter a new task...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: lightNavy,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onSubmitted: (value) => _addTask(),
            ),
          ),
          SizedBox(width: 12),
          ElevatedButton(
            onPressed: _addTask,
            style: ElevatedButton.styleFrom(
              backgroundColor: gold,
              foregroundColor: navyBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
            ),
            child: Icon(
              Icons.add,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}