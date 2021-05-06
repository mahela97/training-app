import 'dart:async';

import 'package:training_app/DiaryCard/DiaryCard.dart';
import 'package:training_app/Firebase/Firestore.dart';

class Bloc {
  //
  final _diaryCardController = StreamController<DiaryCard>();
  final _diaryCardsController = StreamController<List<DiaryCard>>();

  get addCard => _diaryCardController.sink.add;
  get getCard => _diaryCardController.stream;

  get addListCards => _diaryCardsController.sink.add;
  get getListCards => _diaryCardsController.stream;

  Bloc() {
    _diaryCardController.stream.listen((event) {
      dbBloc.addData(event);
    });
  }
}

final bloc = Bloc();
