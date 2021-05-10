import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:training_app/db/models/DiaryCard.dart';
import 'package:training_app/utils/db_util.dart';

class DiaryCardRepository extends FirebaseRepository<DiaryCard> {
  @override
  DiaryCard fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return DiaryCard(
        data[DiaryCard.TITLE_FILED],
        data[DiaryCard.SUBTITLE_FILED],
        data[DiaryCard.DESCRIPTION_FILED],
        data[DiaryCard.CARDCOLOR_FILED]);
  }

  @override
  Map<String, dynamic> toMap(DiaryCard item) {
    // TODO: implement toMap
    return {
      'title': item.title,
      'subtitle': item.subtitle,
      'description': item.description,
      'cardColor': item.cardColor
    };
  }

  @override
  Stream<List<DiaryCard>> query(
      {SpecificationI specification, String type, DocumentReference parent}) {
    // TODO: implement query
    return super
        .query(specification: specification, type: DIARYCARD, parent: null);
  }

  @override
  Future<DocumentReference> add({
    @required DiaryCard item,
    String type,
    DocumentReference parent,
  }) {
    return super.add(
      item: item,
      type: DIARYCARD,
      parent: null,
    );
  }
}
