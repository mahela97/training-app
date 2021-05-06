import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:training_app/DiaryCard/DiaryCard.dart';

class DBbloc {
  List<DiaryCard> cards = [];

  final db = FirebaseFirestore.instance;
  final _diaryDataSaveController = StreamController<DiaryCard>();
  final _diaryDataReadController = StreamController<List<DiaryCard>>();

  get addData => _diaryDataSaveController.sink.add;
  get saveData => _diaryDataSaveController.stream;

  get addRead => _diaryDataReadController.sink.add;
  get readStream => _diaryDataReadController.stream;

  DBbloc() {
    _diaryDataSaveController.stream.listen((event) {
      saveToDB(event.title, event.subtitle, event.description,
          event.cardColor.value.toRadixString(16).padLeft(8, '0'));
      addRead(cards);
    });
  }

  void saveToDB(
      String title, String subtitle, String description, String color) async {
    DocumentReference ref = await db.collection("DiaryCards").add({
      'title': '$title',
      'subtitle': '$subtitle',
      'description': '$description',
      'cardColor': '$color'
    });
  }
}

final DBbloc dbBloc = DBbloc();
