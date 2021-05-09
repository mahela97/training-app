import 'package:flutter/material.dart';
import 'package:training_app/DiaryHome_page/DiaryHome_page.dart';

class DiaryHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Diary app",
      home: DiaryHomeProvider(),
    );
  }
}
