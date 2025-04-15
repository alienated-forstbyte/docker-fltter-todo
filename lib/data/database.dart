import 'package:hive_flutter/adapters.dart';

class TodoDatabase{

  List to_do_list = [];

  final _myBox = Hive.box('myBox');

  void createInitialData(){
    to_do_list = [["Task Name",false]];
  }

  void loadData(){
    to_do_list = _myBox.get("TODOLIST");
  }

  void updateDataBase(){
    _myBox.put("TODOLIST", to_do_list);
  }
}