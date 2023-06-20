import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/home.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
           // statusBarColor: Colors.transparent
        ),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do App",
      home: home(),
    );
  }
}
