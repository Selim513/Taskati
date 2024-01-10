import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/services/local_Storage.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/widgets/custom_Buttons.dart';
import 'package:taskati_todo_app/features/home/home.dart';
import 'package:taskati_todo_app/features/upload/upload_screen.dart';

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
              onPressed: () {},
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
                          onPressed: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              backgroundColor: Colors.black,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 400,
                                            child: CustomButtons(
                                                onPressd: () {
                                                  uploadFromCamera();
                                                  setState(() {});
                                                  Navigator.of(context).pop();
                                                },
                                                text: "Upload From Camera"),
                                          ),
                                          Gap(10),
                                          SizedBox(
                                            width: 400,
                                            child: CustomButtons(
                                                onPressd: () {
                                                  setState(() {
                                                    uploadFromGallery();
                                                  });
                                                },
                                                text: "Upload From Gallery"),
                                          )
                                        ],
                                      )),
                                );
                              },
                            );
                          },
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

  uploadFromCamera() async {
    final editPickCamera =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (editPickCamera != null) {
      appStorage.cachedData("image", editPickCamera.path);
      setState(() {
        imagePath = editPickCamera.path;
      });
    }
  }

  uploadFromGallery() async {
    final editPickCamera =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (editPickCamera != null) {
      appStorage.cachedData("image", editPickCamera.path);
      setState(() {
        imagePath = editPickCamera.path;
      });
    }
  }
}
