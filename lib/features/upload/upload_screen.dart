// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/services/local_Storage.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/widgets/custom_Buttons.dart';
import 'package:taskati_todo_app/core/widgets/custom_snackBar.dart';
import 'package:taskati_todo_app/features/home/home.dart';

String? imagePath;
String name = "";

class Uploadscreen extends StatefulWidget {
  const Uploadscreen({super.key});

  @override
  State<Uploadscreen> createState() => _UploadscreenState();
}

class _UploadscreenState extends State<Uploadscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (imagePath != null && name.isNotEmpty) {
                  appStorage.cachedData(appStorage.IS_UPLOAD, true);
                  appStorage.cachedData(appStorage.IMAGE, imagePath!);
                  appStorage.cachedData(appStorage.NAME, name);
                  gotoreplace(context, const Home());
                } else if (imagePath == null && name.isNotEmpty) {
                  ShowsnakeBar(context, "Please Enter Your Photo");
                } else if (imagePath != null && name.isEmpty) {
                  ShowsnakeBar(context, "Please enter your Name");
                } else {
                  ShowsnakeBar(context,
                      "Please Fill Your name And Your photo to continue...");
                }
              },
              child: Text(
                "Next",
                style: Theme.of(context).textTheme.displaySmall,
              )),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: (imagePath != null)
                    ? FileImage(File(imagePath!)) as ImageProvider
                    : const AssetImage("assets/user.png"),
              ),
              const Gap(20),
              CustomButtons(
                onPressd: () {
                  setState(() {
                    UploadFromCamera();
                  });
                },
                text: "Take A Camera Shot",
              ),
              const Gap(10),
              CustomButtons(
                  onPressd: () {
                    setState(() {
                      UploadFromGallery();
                    });
                  },
                  text: "Upload From Gallery"),
              const Gap(30),
              Divider(
                indent: 50,
                endIndent: 50,
                color: Appcolors.greyColor,
              ),
              const Gap(30),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodySmall,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter Your Name"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  UploadFromCamera() async {
    final imagepicked =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagepicked != null) {
      setState(() {
        imagePath = imagepicked.path;
      });
    }
  }

  UploadFromGallery() async {
    final imagepicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagepicked != null) {
      setState(() {
        imagePath = imagepicked.path;
      });
    }
  }
}
