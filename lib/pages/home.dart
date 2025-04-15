import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:todo_application/data/database.dart';
import 'package:todo_application/utils/dialogBox.dart';
import 'package:todo_application/utils/todoTile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  final _myBox = Hive.box('myBox');

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.to_do_list[index][1] = !db.to_do_list[index][1];
    });
    db.updateDataBase();
  }

  void createNewTask(){
    showDialog(context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: addNewTask,
          );
        }
    );
    db.updateDataBase();
  }

  void addNewTask() {
    setState(() {
      db.to_do_list.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index){
    setState(() {
      db.to_do_list.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("Todo Application",
              style:TextStyle(color:Colors.white)),

          backgroundColor:Colors.blueAccent,
          actions: [
            IconButton(
              onPressed: () {
                db.updateDataBase();
                print(db.to_do_list);
                SystemNavigator.pop();
              },
              icon: const Icon(Icons.logout,color: Colors.white,),
            ),
          ],
        ),
      
      body: ListView.builder(
        itemCount : db.to_do_list.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(taskCompleted: db.to_do_list[index][1],
              taskName: db.to_do_list[index][0],
            onChanged: (value) => checkBoxChanged(value,index),
            deleteTask: (context) => deleteTask(index),
          );
        },
        
      ),

      floatingActionButton: FloatingActionButton(onPressed: () => createNewTask(),
      backgroundColor: Colors.blueAccent,
      child: const Icon(Icons.add,color: Colors.white,),),
      );
  }
}

