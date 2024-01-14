import 'package:flutter/material.dart';
import 'package:todo/myColors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:18 ,vertical: 7),
      child: ListTile(

        onTap: (){

          print("Clicked On Todo Item");

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: EdgeInsets.symmetric(vertical:5 ,horizontal: 22),
        tileColor: MyWhite,
        leading: Icon(
          size: 20,
          Icons.check_box,
          color: Colors.black,
        ),

        title: Text('check mail',
          style: TextStyle(
            fontSize: 18,color: Colors.black,decoration:TextDecoration.lineThrough ,
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
            onPressed: (){

              print("delete todo item");

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