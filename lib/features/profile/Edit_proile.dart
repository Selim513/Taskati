import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/features/home/home.dart';
import 'package:taskati_todo_app/features/upload/upload_screen.dart';
import 'package:taskati_todo_app/main.dart';

final bool defaultValue = true;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(
                Icons.dark_mode_rounded,
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: (imagePath != null)
                        ? FileImage(File(imagePath!)) as ImageProvider
                        : AssetImage("assets/user.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: IconButton(
                          color: Appcolors.buttonsColor,
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt_rounded)),
                    ),
                  )
                ],
              ),
              Gap(30),
              Divider(
                indent: 30,
                endIndent: 30,
              ),
              Gap(30),
              Row(
                children: [
                  Text(name, style: Theme.of(context).textTheme.displayMedium),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_outlined,
                        color: Appcolors.buttonsColor,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
