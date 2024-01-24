import 'package:flutter/material.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["id"]);
  }
}
