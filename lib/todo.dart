//import 'package:flutter/cupertino.dart';

class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false
});
  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'hi',isDone: true),
      ToDo(id: '02', todoText: 'hello',isDone: true),
      ToDo(id: '03', todoText: 'my'),
      ToDo(id: '04', todoText: 'name'),
      ToDo(id: '05', todoText: 'is'),
      ToDo(id: '06', todoText: 'abhi'),

    ];
  }
}