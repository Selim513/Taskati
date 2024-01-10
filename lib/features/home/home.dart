import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';
import 'package:taskati_todo_app/core/widgets/custom_Buttons.dart';
import 'package:taskati_todo_app/features/add/add_tasks.dart';

import 'package:taskati_todo_app/features/home/widgets/home_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var Date = DateFormat.yMMMd().format(DateTime.now());

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
                Spacer(),
                CustomButtons(
                    onPressd: () {
                      gotopush(context, AddTask());
                    },
                    text: "+ Add Task")
              ],
            ),
            Gap(15),
            SizedBox(
              height: 90,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Appcolors.buttonsColor,
                selectedTextColor: Colors.white,

                //    onDateChange: (date) {
                // New date selected
                //    setState(() {
                //    _selectedValue = date as bool;
                //});
                //  },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
