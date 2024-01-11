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
                              style: getlargefont(),
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
                const Gap(15),
                SizedBox(
                  height: 100,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Appcolors.buttonsColor,
                    selectedTextColor: Colors.white,
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
                  return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.red,
                        child: Text("Remove"),
                      ),
                      secondaryBackground: Container(
                        color: Colors.green,
                        child: Text("Completed"),
                      ),
                      child: TasksWidgets(tasks: tasks));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
