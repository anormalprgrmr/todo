class ToDoModel {
  String? id;
  String? Text;
  bool isDone;

  ToDoModel({
    required this.id,
    required this.Text,
    this.isDone = false,
  });

  static List<ToDoModel> myList = [
    ToDoModel(id: "1", Text: "Text",isDone: false),
    ToDoModel(id: "2", Text: " 2222222222",isDone: true),
    ToDoModel(id: "3", Text: "asdsadasd"),
    ToDoModel(id: "3", Text: "sajsas"),
  ];
}