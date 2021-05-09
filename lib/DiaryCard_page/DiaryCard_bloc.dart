import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';

import 'DiaryCard_event.dart';
import 'DiaryCard_state.dart';

class DiaryCardBloc extends Bloc<DiaryCardEvent, DiaryCardState> {
  static final log = Log("DiaryCardBloc");

  DiaryCardBloc(BuildContext context) : super(DiaryCardState.initialState);

  @override
  Stream<DiaryCardState> mapEventToState(DiaryCardEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ShowToggleEvent:
        final showToggle = (event as ShowToggleEvent).showToggle;
        final maxLines = (event as ShowToggleEvent).maxLines;
        final isVisible = (event as ShowToggleEvent).isVisible;
        yield state.clone(showToggle: showToggle,maxLines: maxLines,isVisible: isVisible);
        break;

    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    log.e('$stacktrace');
    log.e('$error');
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) {
      return;
    }
    try {
      add(ErrorEvent(
        (e is String)
            ? e
            : (e.message ?? "Something went wrong. Please try again !"),
      ));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again !"));
    }
  }
}
