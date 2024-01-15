import 'package:hive/hive.dart';
part 'ToDoModel.g.dart';

@HiveType(typeId: 0)
class ToDoModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? Text;
  @HiveField(2,defaultValue: false)
  bool isDone;

  ToDoModel({
    required this.id,
    required this.Text,
    this.isDone = false,
  });

}