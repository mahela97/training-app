import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'DiaryCard_bloc.dart';
import 'DiaryCard_view.dart';

class DiaryCardProvider extends BlocProvider<DiaryCardBloc> {
  final String title;
  final String description;

  DiaryCardProvider(
    this.title,
    this.description, {
    Key key,
  }) : super(
          key: key,
          create: (context) => DiaryCardBloc(context),
          child: DiaryCardView(title, description),
        );
}
