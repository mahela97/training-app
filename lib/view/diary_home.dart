import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'diary_home_page/diary_home_provider.dart';

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
