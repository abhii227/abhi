import 'package:flutter/material.dart';
import 'package:to_do_app/colors.dart';
import 'package:to_do_app/todo.dart';

class ToDoitem extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;

  const ToDoitem({Key? key,
    required this.todo,
    required this.onToDoChange,
    required this.onDeleteItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
         // print('Clicked on ToDo Item');
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
           todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
          color: blue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: black,
              decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon:const Icon(Icons.delete),
            iconSize: 25,
            color: Colors.white,
            padding:
            const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 5),
            onPressed:(){
              //print('Clicked on ToDo Item');
              onDeleteItem(todo.id);
            },
          ),
        )
        ),
      );

  }
}
