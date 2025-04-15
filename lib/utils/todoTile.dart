import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget{
  final bool taskCompleted;
  final String taskName;

  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoTile({
    super.key,
    required this.taskCompleted,
    required this.taskName,
    required this.onChanged,
    required this.deleteTask,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 24,top: 12,bottom: 12),
      child: Slidable(
        endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(24),)
            ]
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: taskCompleted? Colors.blueGrey: const Color(0xFA1eaeff),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.white,checkColor: Colors.blueAccent,),
              Text(taskName,style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),),
            ],
          ),
        
        ),
      ),
    );
  }
  
}