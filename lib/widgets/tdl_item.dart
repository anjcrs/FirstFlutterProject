import 'package:flutter/material.dart';
import '../screens/todolist_screen.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem item;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  // Color constants
  static const Color navyBlue = Color(0xFF1B2951);
  static const Color lightNavy = Color(0xFF2D4A73);
  static const Color gold = Color(0xFFD4AF37);

  const TodoItemWidget({
    Key? key,
    required this.item,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: lightNavy,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Checkbox(
          value: item.isCompleted,
          onChanged: (bool? value) => onToggle(),
          activeColor: gold,
          checkColor: navyBlue,
          side: BorderSide(color: gold, width: 2),
        ),
        title: Text(
          item.task,
          style: TextStyle(
            color: item.isCompleted ? Colors.grey : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: item.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: gold,
          ),
          onPressed: onDelete,
        ),
      ),
    );
  }
}