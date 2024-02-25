import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskati_todo_app/core/model/task_model.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';
import 'package:taskati_todo_app/features/home/widgets/Tasks.dart';

class DissmisbleWidget extends StatelessWidget {
  const DissmisbleWidget({
    super.key,
    required this.task,
    required this.box,
  });

  final TaskModel task;
  final Box<TaskModel> box;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            box.put(
                task.id,
                TaskModel(
                    id: task.id,
                    title: task.title,
                    note: task.note,
                    date: task.date,
                    startTime: task.startTime,
                    endTime: task.endTime,
                    color: 3,
                    iscompleted: true));
          } else {
            box.delete(task.id);
          }
        },
        background: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: Text(
                "Remove",
                style: getlargefont(),
              ),
            ),
          ],
        ),
        secondaryBackground: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: Text(
                "Complete",
                style: getlargefont(),
              ),
            ),
          ],
        ),
        child: TasksWidgets(tasks: task));
  }
}
