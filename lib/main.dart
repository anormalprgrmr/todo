import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/pages/home.dart';

void main() {
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
