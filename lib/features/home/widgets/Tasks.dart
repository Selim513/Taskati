// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_todo_app/core/model/task_model.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';

class TasksWidgets extends StatelessWidget {
  const TasksWidgets({
    super.key,
    required this.tasks,
  });

  final TaskModel tasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: tasks.color == 3
              ? Colors.green
              : tasks.color == 0
                  ? Colors.blue
                  : tasks.color == 1
                      ? Colors.orange
                      : tasks.color == 2
                          ? Colors.red
                          : Colors.blue,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      tasks.title,
                      style: getmeduimfont(color: Colors.white),
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_rounded,
                      color: Colors.white,
                    ),
                    const Gap(10),
                    Text(
                      tasks.startTime,
                      style: getsmallfont(color: Colors.white),
                    ),
                    Text(
                      ' - ',
                      style: getsmallfont(color: Colors.white),
                    ),
                    Text(
                      tasks.endTime,
                      style: getsmallfont(color: Colors.white),
                    ),
                  ],
                ),
                const Gap(10),
                Text(
                  tasks.note,
                  overflow: TextOverflow.clip,
                  style: getmeduimfont(color: Colors.white),
                ),
              ],
            ),
          ),
          const Gap(8),
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.white,
                width: 2,
              ),
            ],
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              tasks.iscompleted ? 'Completed' : 'TODO',
              style: getmeduimfont(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
