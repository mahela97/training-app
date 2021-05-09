import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/DiaryCard_page/DiaryCard_page.dart';

import 'DiaryCard_bloc.dart';
import 'DiaryCard_state.dart';

class DiaryCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final diaryCardBloc = BlocProvider.of<DiaryCardBloc>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          color: diaryCardBloc.state.cardColor,
          border: Border.all(width: 4, color: Color(0xff009FE0)),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            diaryCardBloc.state.title,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(diaryCardBloc.state.subtitle,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xff668490),
                decoration: TextDecoration.none,
                fontSize: 20,
              )),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<DiaryCardBloc, DiaryCardState>(
            builder: (context, state) {
              return Text(diaryCardBloc.state.description,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.w100),
                  textAlign: TextAlign.left,
                  maxLines: state.maxLines);
            },
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<DiaryCardBloc, DiaryCardState>(
            builder: (context, state) {
              return TextButton(
                  child: Text(
                    state.showToggle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xff1A2125), fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (state.isVisible) {
                      diaryCardBloc.add(ShowToggleEvent("Show More", false, 3));
                    } else {
                      diaryCardBloc.add(ShowToggleEvent("Show Less", true, 10));
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}
