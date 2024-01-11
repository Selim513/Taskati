import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_todo_app/core/model/task_model.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';

class TasksWidgets extends StatelessWidget {
  const TasksWidgets({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: tasks[index].color == 0
                  ? Colors.blue
                  : tasks[index].color == 1
                      ? Colors.orange
                      : tasks[index].color == 2
                          ? Colors.red
                          : Colors.green),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tasks[index].title,
                    style: getmeduimfont(color: Colors.white),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                      ),
                      const Gap(10),
                      Text(
                        "${tasks[index].startTime}-${tasks[index].endTime}",
                        style: getnormalfont(color: Colors.white),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Text(
                    tasks[index].note,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              const Spacer(),
              Container(
                width: 1,
                height: 60,
                color: Colors.white,
              ),
              RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    tasks[index].iscompleted ? 'Completed' : 'TODO',
                    style: getmeduimfont(color: Colors.white),
                  ))
            ],
          ),
        );
      },
    );
  }
}
