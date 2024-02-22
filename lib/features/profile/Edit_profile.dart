// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
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
  late Box<bool> modeBox;

  @override
  void initState() {
    super.initState();
    modeBox = Hive.box("mode");

    appStorage.getcahcedData("name").then((value) {
      name = value;
    });
    appStorage.getcahcedData("image").then((value) {
      imagePath = value;
    });
  }

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isdark = modeBox.get("darkMode") ?? true;
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  modeBox.put("darkMode", !isdark);
                });
              },
              icon: Icon(
                isdark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
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
                        : const AssetImage("assets/user.png"),
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
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              backgroundColor: Colors.black,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SizedBox(
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
                                          const Gap(10),
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
                          icon: const Icon(Icons.camera_alt_rounded)),
                    ),
                  )
                ],
              ),
              const Gap(30),
              const Divider(
                indent: 30,
                endIndent: 30,
              ),
              const Gap(30),
              Row(
                children: [
                  Text(name, style: Theme.of(context).textTheme.displayMedium),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Form(
                                    key: formKey,
                                    child: SingleChildScrollView(
                                      child: Container(
                                        height: 400,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Your Should Fill the Field";
                                                }
                                                return null;
                                              },
                                              controller: nameController,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              decoration: InputDecoration(
                                                  labelText: "Edit ",
                                                  labelStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium),
                                            ),
                                            const Gap(10),
                                            SizedBox(
                                              width: 400,
                                              child: CustomButtons(
                                                  onPressd: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      appStorage.cachedData(
                                                          "name",
                                                          nameController.text);
                                                      Navigator.of(context)
                                                          .pop();
                                                      setState(() {
                                                        name =
                                                            nameController.text;
                                                      });
                                                    }
                                                  },
                                                  text: "Confirm"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
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
