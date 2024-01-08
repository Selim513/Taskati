import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/services/local_Storage.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';
import 'package:taskati_todo_app/features/profile/Edit_proile.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? name;
  String? imagePath;
  @override
  void initState() {
    super.initState();
    appStorage.getcahcedData("name").then((value) {
      setState(() {
        name = value;
      });
      appStorage.getcahcedData("image").then((value) {
        setState(() {
          imagePath = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Hello, ",
                  style: Theme.of(context).textTheme.displaySmall),
              TextSpan(text: name, style: getsmallfont(color: Colors.blue)),
            ]))
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            gotopush(context, EditProfile());
          },
          child: CircleAvatar(
            radius: 30,
            backgroundImage: (imagePath != null)
                ? FileImage(File(imagePath!)) as ImageProvider
                : AssetImage("assets/user.png"),
          ),
        ),
      ],
    );
  }
}
