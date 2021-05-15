import 'package:flutter/material.dart';

@immutable
class DiaryCardState {
  final bool showMore;
  final Color cardColor;
  final String error;

  DiaryCardState({
    @required this.showMore,
    @required this.cardColor,
    @required this.error,
  });

  static DiaryCardState get initialState => DiaryCardState(
    showMore: true,
        cardColor: Color(0xffB3E9FE),
        error: '',
      );

  DiaryCardState clone({
    bool showMore,
    int maxLines,
    Color cardColor,
    String error,
  }) {
    return DiaryCardState(
      showMore: showMore ?? this.showMore,
      cardColor: cardColor ?? this.cardColor,
      error: error ?? this.error,
    );
  }
}
