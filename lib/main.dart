import 'package:flutter/material.dart';
import 'package:training_app/Pages/DiaryHome.dart';
import 'DiaryCard/DiaryCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DiaryHome();
  }
}
