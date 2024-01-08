import 'package:flutter/material.dart';

gotopush(context, Widget newscreen) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => newscreen)));
}

gotoreplace(context, Widget newscreen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => newscreen));
}
