import 'package:flutter/material.dart';

@immutable
class DiaryCardState {
  final String showToggle;
  final int maxLines;
  final Color cardColor;
  final String error;

  DiaryCardState({
    @required this.showToggle,
    @required this.maxLines,
    @required this.cardColor,
    @required this.error,
  });

  static DiaryCardState get initialState => DiaryCardState(
        showToggle: "Show More",
        maxLines: 3,
        cardColor: Color(0xffB3E9FE),
        error: '',
      );

  DiaryCardState clone({
    String showToggle,
    int maxLines,
    Color cardColor,
    String error,
  }) {
    return DiaryCardState(
      showToggle: showToggle ?? this.showToggle,
      maxLines: maxLines ?? this.maxLines,
      cardColor: cardColor ?? this.cardColor,
      error: error ?? this.error,
    );
  }
}
