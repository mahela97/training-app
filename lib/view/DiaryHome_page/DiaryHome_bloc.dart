import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:training_app/db/repo/DiaryCardRepository.dart';
import 'package:training_app/view/DiaryHome_page/DiaryHome_page.dart';
import 'DiaryHome_event.dart';
import 'DiaryHome_state.dart';

class DiaryHomeBloc extends Bloc<DiaryHomeEvent, DiaryHomeState> {
  static final log = Log("DiaryHomeBloc");
  final diaryCardRepository = DiaryCardRepository();

  DiaryHomeBloc(BuildContext context) : super(DiaryHomeState.initialState) {
    diaryCardRepository
        .query(specification: ComplexSpecification([]))
        .listen((event) {
      add(LoadDiaryCardsEvent(event));
    });
  }

  @override
  Stream<DiaryHomeState> mapEventToState(DiaryHomeEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case FirebaseInitEvent:
        Firebase.initializeApp();
        break;
      case LoadDiaryCardsEvent:
        final diaryCard = (event as LoadDiaryCardsEvent).diaryCard;
        yield state.clone(diaryCard: diaryCard);
        break;
      case ValidateTitleEvent:
        final validateTitle = (event as ValidateTitleEvent).validateTitle;
        yield state.clone(validateTitle: validateTitle);
        break;
      case ValidateDescriptionEvent:
        final validateDescrip = (event as ValidateDescriptionEvent).validateDescrip;
        yield state.clone(validateDescrip: validateDescrip);
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
