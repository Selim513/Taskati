import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/widgets/custom_Buttons.dart';
import 'package:taskati_todo_app/features/add/add_tasks.dart';

import 'package:taskati_todo_app/features/home/widgets/home_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            HomeHeader(),
            Gap(20),
            Row(
              children: [
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Spacer(),
                CustomButtons(
                    onPressd: () {
                      gotopush(context, AddTask());
                    },
                    text: "+ Add Task")
              ],
            )
          ],
        ),
      )),
    );
  }
}
