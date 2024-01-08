import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/widgets/custom_Buttons.dart';
import 'package:taskati_todo_app/features/home/home.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              gotoreplace(context, Home());
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
            )),
        centerTitle: true,
        title: Text(
          "Add Task",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
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
              Gap(10),
              TextFormField(
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: "Enter Title Here",
                ),
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    "Note",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              Gap(10),
              TextFormField(
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: "Enter Note Here",
                ),
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    "Date",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              Gap(10),
              TextField(
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.date_range_sharp),
                  hintText: " 1/1/2024",
                ),
              ),
              Gap(10),
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
                        Gap(10),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.timer_outlined),
                              hintText: "2:30 AM",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(50),
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
                        Gap(10),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.timer_sharp),
                              hintText: "2:45 Am",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(10),
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
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                padding: EdgeInsetsDirectional.zero,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.check_circle,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsetsDirectional.zero,
                                onPressed: () {},
                                icon: Icon(Icons.circle,
                                    size: 30, color: Appcolors.orangeColor),
                              ),
                              IconButton(
                                padding: EdgeInsetsDirectional.zero,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.circle,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  CustomButtons(onPressd: () {}, text: "+ Add Task")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
