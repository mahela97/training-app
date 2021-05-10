import 'package:flutter/material.dart';
import 'package:training_app/db/models/DiaryCard.dart';

@immutable
abstract class DiaryHomeEvent {}

class ErrorEvent extends DiaryHomeEvent {
  final String error;

  ErrorEvent(this.error);
}

class LoadDiaryCardsEvent extends DiaryHomeEvent {
  final List<DiaryCard> diaryCard;

  LoadDiaryCardsEvent(this.diaryCard);
}

class FirebaseInitEvent extends DiaryHomeEvent {
  FirebaseInitEvent();
}

class ValidateTitleEvent extends DiaryHomeEvent {
  final bool validateTitle;

  ValidateTitleEvent(this.validateTitle);
}

class ValidateDescriptionEvent extends DiaryHomeEvent {
  final bool validateDescrip;

  ValidateDescriptionEvent(this.validateDescrip);
}
