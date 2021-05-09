import 'package:flutter/material.dart';
import 'package:training_app/DiaryCard_page/DiaryCard_view.dart';

@immutable
abstract class DiaryHomeEvent {}

class ErrorEvent extends DiaryHomeEvent {
  final String error;

  ErrorEvent(this.error);
}

class SubmitCardEvent extends DiaryHomeEvent{
  final DiaryCardView diaryCardView;

  SubmitCardEvent(this.diaryCardView);
}