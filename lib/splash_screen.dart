import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_todo_app/core/functions/route.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';
import 'package:taskati_todo_app/features/home/home.dart';
import 'package:taskati_todo_app/features/upload/upload_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4, milliseconds: 600), () {
      gotoreplace(context, const Uploadscreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/splashcreen.json", animate: true),
            Text(
              "Taskati",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Gap(15),
            Text(
              "It\'s time to Get Organized",
              style: getmeduimfont(
                  fontweight: FontWeight.normal, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
