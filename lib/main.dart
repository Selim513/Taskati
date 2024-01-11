// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati_todo_app/core/thems.dart';

import 'package:taskati_todo_app/splash_screen.dart';

import 'core/model/task_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("user");
  await Hive.openBox<bool>("mode");
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>("task");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>("mode").listenable(),
      builder: (context, value, child) {
        bool darkMode = value.get("darkMode", defaultValue: false)!;
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: const Splashscreen(),
        );
      },
    );
  }
}
