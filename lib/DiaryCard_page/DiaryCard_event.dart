import 'package:flutter/material.dart';

@immutable
abstract class DiaryCardEvent {}

class ErrorEvent extends DiaryCardEvent {
  final String error;

  ErrorEvent(this.error);
}

class ShowToggleEvent extends DiaryCardEvent {
  final String showToggle;
  final bool isVisible;
  final int maxLines;

  ShowToggleEvent(this.showToggle,this.isVisible,this.maxLines);
}

