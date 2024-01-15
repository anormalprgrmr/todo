import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/ToDoModel.dart';

class ToDoDataBase {
  List<ToDoModel> TodoList = [] ;
  final _mybox = Hive.box("mybox");

  ToDoDataBase(){
    // loadDataBase();
  }

  void loadDataBase(){
    // TodoList = _mybox.get("todo");

    for (var i = 0; i < _mybox.length; i++) {
        TodoList.add(_mybox.getAt(i));
    }

    print(_mybox);
  } 

  void updateDataBase(){

    for (var element in _mybox.keys) {
      _mybox.delete(element);
    }

    for (var element in TodoList) {
      _mybox.add(element);
    }

    print(_mybox.toString());
    print(TodoList);
  }

  void addTODB(ToDoModel todo){

    _mybox.add(todo);

  }

}