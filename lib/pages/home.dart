
import 'package:flutter/material.dart';
import 'package:todo/ToDoModel.dart';
import 'package:todo/ToDoItem.dart';
import 'package:todo/myColors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myLst = ToDoModel.myList;
  List<ToDoModel> _foundToDo = [];
  final _addController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _foundToDo = myLst;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyGreen,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                _SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        child: Text(
                          'All ToDos ',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      for (ToDoModel todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(25, 163, 60, 1),
                        blurRadius: 10,
                        offset: Offset(5, 5),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: TextField(
                    controller: _addController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 25),
                      hintText: 'Add a new item ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 15),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 30, color: MyWhite),
                  ),
                  onPressed: () {
                    _addToDoItem(_addController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(30, 134, 74, 1),
                    minimumSize: Size(40, 40),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDoModel todoo) {
    setState(() {
      todoo.isDone = !todoo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      myLst.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String text) {
    
    if (text.isNotEmpty) {
      setState(() {
      myLst.add(
          ToDoModel(id: DateTime.now().millisecond.toString(), Text: text));
    });
    }

    _addController.clear();
  }

  void _runFilter(String myFilter){
    List<ToDoModel> results= [];

    if (myFilter.isEmpty) {
      results = myLst;
    }else{
        results = myLst.where((element) => element.Text!.toLowerCase().contains(myFilter.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo = results ;
    });
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
        onChanged: (value) => _runFilter(value),
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
