import 'package:flutter/material.dart';

@immutable
abstract class DiaryCardEvent {}

class ErrorEvent extends DiaryCardEvent {
  final String error;

  ErrorEvent(this.error);
}

class ShowToggleEvent extends DiaryCardEvent {
  final bool showMore;

  ShowToggleEvent(this.showMore);
}

