import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:training_app/view/DiaryHome_page/widgets//DiaryCard_page/DiaryCard_page.dart';
import 'package:training_app/view/DiaryHome_page/DiaryHome_page.dart';

class DiaryHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return MaterialApp(
            home: DiaryHomeProvider(),
          );
        });
    ;
  }
}
