import 'package:flutter/material.dart';
import 'package:todo/ToDoItem.dart';
import 'package:todo/myColors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyGreen,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            _SearchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 12),
                    child: Text(
                      'All ToDos ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ToDoItem(),
                  ToDoItem(),
                  ToDoItem(),
                  ToDoItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _SearchBox() {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyWhite,
        shape: BoxShape.rectangle,
      ),
      child: TextField(
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.black),
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(15, 9, 0, 0),
          hintText: 'Search',
          hintStyle: TextStyle(color: Color.fromRGBO(102, 105, 108, 1)),
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: MyGreen,
    elevation: 0,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
      SizedBox(
        height: 33,
        width: 33,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/images/avatar.png'),
        ),
      ),
    ]),
  );
}
