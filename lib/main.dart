import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati_todo_app/core/thems.dart';
import 'package:taskati_todo_app/features/profile/Edit_proile.dart';
import 'package:taskati_todo_app/splash_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("user");
  await Hive.openBox<bool>("mode");
  runApp(MyApp());
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
        bool darkMode = value.get("darkMode", defaultValue: true)!;
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: Splashscreen(),
        );
      },
    );
  }
}