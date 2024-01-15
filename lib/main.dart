import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/ToDoModel.dart';
import 'package:todo/pages/home.dart';
import 'package:hive/hive.dart';

void main() async{

  Hive.init("path");
  Hive.registerAdapter(ToDoModelAdapter());
  var box = await Hive.openBox("mybox");

  // box.put("hh",ToDoModel(id: "88", Text: "468468468"));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{

  const MyApp ({Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context){

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

        statusBarColor: Colors.transparent,

      ));
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "To Do - Samian Soft",
      home: Home(),

    );
  }

}
