// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/model/task_model.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/widgets/custom_Buttons.dart';
import 'package:taskati_todo_app/features/home/home.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late Box<TaskModel> box;
  var titleController = TextEditingController();
  var noteController = TextEditingController();

  var Date = DateTime.now();
  var startTime = DateFormat("hh:mm: a").format(DateTime.now());
  var endTime = DateFormat("hh:mm: a").format(DateTime.now());
  int indexColour = 0;
  @override
  void initState() {
    super.initState();
    box = Hive.box("task");
  }

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              gotoreplace(context, const Home());
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        centerTitle: true,
        title: const Text(
          "Add Task",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Title",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "You should fill the field";
                    }
                    return null;
                  },
                  controller: titleController,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: const InputDecoration(
                    hintText: "Enter Title Here",
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    Text(
                      "Note",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const Gap(10),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "You should fill the field";
                    }
                    return null;
                  },
                  controller: noteController,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: const InputDecoration(
                    hintText: "Enter Note Here",
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    Text(
                      "Date",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const Gap(10),
                TextFormField(
                  readOnly: true,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          getTaskDate();
                        },
                        icon: const Icon(Icons.calendar_month_sharp)),
                    hintText: DateFormat.yMd().format(Date),
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Start Time",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          const Gap(10),
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              readOnly: true,
                              style: Theme.of(context).textTheme.bodySmall,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      getTaskStartTime();
                                    },
                                    icon: const Icon(Icons.timer_outlined)),
                                hintText: startTime,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(50),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "End Time",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          const Gap(10),
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              readOnly: true,
                              style: Theme.of(context).textTheme.bodySmall,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      getTaskEndTime();
                                    },
                                    icon: const Icon(Icons.timer_outlined)),
                                hintText: endTime,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Color",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexColour = 0;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    child: indexColour == 0
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : const SizedBox(),
                                  ),
                                ),
                                const Gap(10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexColour = 1;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    child: indexColour == 1
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : const SizedBox(),
                                  ),
                                ),
                                const Gap(10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexColour = 2;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: indexColour == 2
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : const SizedBox(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    CustomButtons(
                        onPressd: () async {
                          if (formkey.currentState!.validate()) {
                            String id =
                                "${titleController.text}$startTime ${DateTime.now().millisecond} ";
                            box.put(
                                id,
                                TaskModel(
                                    id: id,
                                    title: titleController.text,
                                    note: noteController.text,
                                    date: Date.toString(),
                                    startTime: startTime,
                                    endTime: endTime,
                                    color: indexColour,
                                    iscompleted: false));
                            // print(Date);
                            gotoreplace(context, const Home());
                          }
                        },
                        text: "+ Add Task")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getTaskDate() {
    showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value != null) {
        setState(() {
          Date = value;
        });
      }
    });
  }

  getTaskStartTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        setState(() {
          startTime = value.format(context);
        });
      }
    });
  }

  getTaskEndTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        setState(() {
          endTime = value.format(context);
        });
      }
    });
  }
}
