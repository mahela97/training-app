import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DiaryCard_bloc.dart';
import 'DiaryCard_view.dart';

class DiaryCardProvider extends BlocProvider<DiaryCardBloc> {
  DiaryCardProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => DiaryCardBloc(context),
          child: DiaryCardView(),
        );
}
