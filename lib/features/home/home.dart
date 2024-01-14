// ignore_for_file: non_constant_identifier_names

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/model/task_model.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';
import 'package:taskati_todo_app/core/widgets/custom_Buttons.dart';
import 'package:taskati_todo_app/features/add/add_tasks.dart';
import 'package:taskati_todo_app/features/home/widgets/Tasks.dart';

import 'package:taskati_todo_app/features/home/widgets/home_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var Date = DateFormat.yMMMd().format(DateTime.now());
  var _selectedValue = DateTime.now().toIso8601String();
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const HomeHeader(),
                const Gap(20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Date,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              "Today",
                              style: Theme.of(context).textTheme.displayLarge,
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButtons(
                        onPressd: () {
                          gotopush(context, const AddTask());
                        },
                        text: "+ Add Task")
                  ],
                ),
                Gap(15),
                SizedBox(
                  height: 100,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Appcolors.buttonsColor,
                    selectedTextColor: Colors.white,
                    dateTextStyle: Theme.of(context).textTheme.bodySmall!,
                    monthTextStyle: Theme.of(context).textTheme.bodySmall!,
                    dayTextStyle: Theme.of(context).textTheme.bodySmall!,
                    onDateChange: (date) {
                      //  New date selected
                      setState(() {
                        _selectedValue = date.toIso8601String();
                      });
                    },
                  ),
                ),
                const Gap(10),
              ],
            ),
            Expanded(
              child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: Hive.box<TaskModel>("task").listenable(),
                builder: (context, box, child) {
                  List<TaskModel> tasks = [];
                  for (var element in box.values) {
                    if (_selectedValue.split("T").first ==
                        element.date.split("T").first) {
                      tasks.add(element);
                    }
                  }
                  return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                box.put(
                                    tasks[index].id,
                                    TaskModel(
                                        id: tasks[index].id,
                                        title: tasks[index].title,
                                        note: tasks[index].note,
                                        date: tasks[index].date,
                                        startTime: tasks[index].startTime,
                                        endTime: tasks[index].endTime,
                                        color: 3,
                                        iscompleted: true));
                              } else {
                                box.delete(tasks[index].id);
                              }
                            },
                            background: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 200,
                                  width: 200,
                                  color: Colors.red,
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
                                  padding: EdgeInsets.all(10),
                                  width: 200,
                                  height: 200,
                                  color: Colors.green,
                                  child: Text(
                                    "Complete",
                                    style: getlargefont(),
                                  ),
                                ),
                              ],
                            ),
                            child: TasksWidgets(tasks: tasks[index]));
                      });
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
