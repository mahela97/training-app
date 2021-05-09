import 'package:flutter/material.dart';

@immutable
class DiaryHomeState {
  final String error;

  DiaryHomeState({
    @required this.error,
  });

  static DiaryHomeState get initialState => DiaryHomeState(
        error: '',
      );

  DiaryHomeState clone({
    String error,
  }) {
    return DiaryHomeState(
      error: error ?? this.error,
    );
  }
}
