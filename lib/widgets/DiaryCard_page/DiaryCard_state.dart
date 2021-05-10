import 'package:flutter/material.dart';

@immutable
class DiaryCardState {
  final String showToggle;
  final bool isVisible;
  final int maxLines;
  final Color cardColor;
  final String description;
  final String subtitle;
  final String title;
  final String error;

  DiaryCardState({
    @required this.showToggle,
    @required this.isVisible,
    @required this.maxLines,
    @required this.cardColor,
    @required this.description,
    @required this.subtitle,
    @required this.title,
    @required this.error,
  });

  static DiaryCardState get initialState => DiaryCardState(
        showToggle: "Show More",
        isVisible: false,
        maxLines: 3,
        cardColor: Color(0xffB3E9FE),
        description: "",
        subtitle: "Mahela",
        title: "",
        error: '',
      );

  DiaryCardState clone({
    String showToggle,
    bool isVisible,
    int maxLines,
    Color cardColor,
    String description,
    String subtitle,
    String title,
    String error,
  }) {
    return DiaryCardState(
      showToggle: showToggle ?? this.showToggle,
      isVisible: isVisible ?? this.isVisible,
      maxLines: maxLines ?? this.maxLines,
      cardColor: cardColor ?? this.cardColor,
      description: description ?? this.description,
      subtitle: subtitle ?? this.subtitle,
      title: title ?? this.title,
      error: error ?? this.error,
    );
  }
}
