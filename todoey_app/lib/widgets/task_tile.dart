import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = false;
  String taskDescription;
  Function checkBoxCallback;
  Function longPressCallback;

  TaskTile({required this.isChecked, required this.taskDescription, required this.checkBoxCallback, required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){longPressCallback();},
      title: Text(
        taskDescription,
        style:
            TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue){checkBoxCallback(newValue);},

      )
    );
  }
}




