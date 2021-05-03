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
    return MaterialApp(
      home: Container(
          width: double.infinity,
          child: Column(
            children: [
              // DiaryCard(title: "Reasons Why Learning English is so Important",
              //   subtitle: "Mahela",
              //   description: "English may not be the most spoken language in the world, but it is the offical"
              //       "This is the description. Hi I am Mahela. How are you? I am fine. "
              //       "Hellow gg wel played. how are you mahela. what are you doing? ",
              //   cardColor:Color(0xffB3E9FE),
              // )

              DiaryHome()
            ],
          )),
    );
  }
}
