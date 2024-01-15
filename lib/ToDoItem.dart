import 'package:flutter/material.dart';
import 'package:todo/ToDoModel.dart';
import 'package:todo/myColors.dart';

class ToDoItem extends StatelessWidget {
  final ToDoModel todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem(
      {Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      child: ListTile(
        onTap: () {
          print("Clicked On Todo Item ${todo.Text}");
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
        tileColor: MyWhite,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.black,
        ),
        title: Text(
          todo.Text!,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              print("delete todo item");
              onDeleteItem(todo.id);
            },
            icon: Icon(Icons.delete),
            color: MyWhite,
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
