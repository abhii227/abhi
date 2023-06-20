import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'todo.dart';
import 'ToDo_item.dart';
import 'colors.dart';

class home extends StatefulWidget {
   const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final todoList = ToDo.todoList();
  List<ToDo> foundToDo = [];
  final ToDoController =TextEditingController();
  @override
  void initState() {
    foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i=0;
    return Scaffold(
      backgroundColor: bgcolor,
      // appBar: AppBar(
      //   elevation: 5,
      // centerTitle: true,
      // title: Text(
      //     "ToDo App",
      // ),
      //   backgroundColor: blue,
      // ),
      drawer: Drawer(),
      appBar:  _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30
            ),
            child: Column(
              children: [
                searchBox(),
                Padding(padding:
                EdgeInsets.all(0),
                ),
                //SizedBox(height: 0,),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50,bottom: 20),
                        child: const Text('All ToDoS',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight:
                          FontWeight.w500,
                        ),
                        ),
                      ),
                      for( ToDo todo in foundToDo.reversed)
                      ToDoitem(
                        todo: todo,
                        onToDoChange: handleToDoChange,
                        onDeleteItem: deleteToDoItem,
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2,2),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: ToDoController,
                  decoration: const InputDecoration(
                    hintText: "add a new todo item",
                    border: InputBorder.none,
                  ),
                ),
              ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: (){
                    if(ToDoController.text=="")
                      {
                        i=1;
                        Fluttertoast.showToast(msg: "Enter titel",toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                      }
                    else
                    {
                      i=2;
                      addToDoItem(ToDoController.text);
                      print(i);
                    }

                  },
                  child: const Text('+',style: TextStyle(fontSize: 40),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ), backgroundColor: blue,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                ),
              )
            ],
            ),
          )
        ],
      ),
    );
  }

  void handleToDoChange(ToDo toDo){
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void deleteToDoItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id==id);
    });
  }

  void addToDoItem(String toDo){
    setState(() {
      todoList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    ToDoController.clear();
}

  void runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todoList;
    }else {
      results = todoList.where((item) => item.todoText!.toLowerCase().contains(
          enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      foundToDo = results;
    });
  }

  Widget searchBox(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value)=> runFilter(value),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search,
            color: black,
            size: 21,
          ),
          prefixIconConstraints:
          const BoxConstraints(
            maxHeight: 20,
            minWidth:25,
          ),
          border: InputBorder.none,
          hintText: "search",
          hintStyle: const TextStyle(color:Colors.grey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: blue,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
      ),
      title: Text("To Do App",style: TextStyle(
        fontSize:25,
        fontWeight: FontWeight.bold,
      ),
      ),
      centerTitle: true,
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Icon(Icons.menu,
      //     color: black,
      //     size: 30,),
      //   ],
      // ),
    );
  }
}
