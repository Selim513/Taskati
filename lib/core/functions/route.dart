import 'package:flutter/material.dart';

gotopush(context, Widget newscreen) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => newscreen)));
}

gotoreplace(context, Widget newscreen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => newscreen));
}

pushandremove(context, Widget newscreen) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => newscreen,
      ),
      (route) => false);
}
