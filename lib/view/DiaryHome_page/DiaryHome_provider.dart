import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'DiaryHome_bloc.dart';
import 'DiaryHome_view.dart';

class DiaryHomeProvider extends BlocProvider<DiaryHomeBloc> {
  DiaryHomeProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => DiaryHomeBloc(context),
          child: DiaryHomeView(),
        );
}
