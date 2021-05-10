import 'package:flutter/material.dart';
import 'package:training_app/db/models/DiaryCard.dart';

@immutable
class DiaryHomeState {
  final bool validateDescrip;
  final bool validateTitle;
  final List<DiaryCard> diaryCard;
  final String error;

  DiaryHomeState({
    @required this.validateDescrip,
    @required this.validateTitle,
    @required this.diaryCard,
    @required this.error,
  });

  static DiaryHomeState get initialState => DiaryHomeState(
        validateDescrip: false,
        validateTitle: false,
        diaryCard: [],
        error: '',
      );

  DiaryHomeState clone({
    bool validateDescrip,
    bool validateTitle,
    List<DiaryCard> diaryCard,
    String error,
  }) {
    return DiaryHomeState(
      validateDescrip: validateDescrip ?? this.validateDescrip,
      validateTitle: validateTitle ?? this.validateTitle,
      diaryCard: diaryCard ?? this.diaryCard,
      error: error ?? this.error,
    );
  }
}
