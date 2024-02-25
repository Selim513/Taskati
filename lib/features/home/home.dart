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
import 'package:taskati_todo_app/features/home/widgets/dissmisbleWidge.dart';
import 'package:taskati_todo_app/features/home/widgets/home_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedValue = DateFormat.yMMMd().format(DateTime.now()).toString();
  var Date = DateFormat.yMMMMd().format(DateTime.now());
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
                const Gap(15),
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
                        _selectedValue = date.toString();
                        // print(_selectedValue);
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
                  List<TaskModel> task = [];
                  for (var element in box.values) {
                    if (_selectedValue == element.date) {
                      task.add(element);
                    }
                  }

                  if (task.isEmpty) {
                    return Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/empty.png'),
                              const Gap(10),
                              Text(
                                'You do not have any tasks yet!\nAdd new tasks to make your days productive.',
                                style: getmeduimfont(),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return ListView.builder(
                      itemCount: task.length,
                      itemBuilder: (context, index) {
                        return DissmisbleWidget(
                          box: box,
                          task: task[index],
                        );
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
