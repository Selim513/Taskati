// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

ShowsnakeBar(context, String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(message)));
}