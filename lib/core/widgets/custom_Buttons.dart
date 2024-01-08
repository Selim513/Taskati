import 'package:flutter/material.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
    required this.text,
    this.onPressd,
  });
  final String text;
  final Function()? onPressd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Appcolors.buttonsColor,
          ),
          onPressed: onPressd,
          child: Text(
            text,
            style: getsmallfont(color: Colors.white),
          )),
    );
  }
}
