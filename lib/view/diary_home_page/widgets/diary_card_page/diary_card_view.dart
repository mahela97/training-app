import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'diary_card_bloc.dart';
import 'diary_card_event.dart';
import 'diary_card_state.dart';

class DiaryCardView extends StatelessWidget {
  final String title;
  final String description;

  DiaryCardView(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    final diaryCardBloc = BlocProvider.of<DiaryCardBloc>(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
            this.title,
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
          Text("Mahela",
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
            buildWhen: (pre, current) => pre.showMore != current.showMore,
            builder: (context, state) {
              return Text(this.description,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.w100),
                  textAlign: TextAlign.left,
                  maxLines: state.showMore ? 3 : 10);
            },
          ),
          SizedBox(height: 10),
          BlocBuilder<DiaryCardBloc, DiaryCardState>(
            builder: (context, state) {
              return TextButton(
                  child: Text(
                    state.showMore ? "Show More" : "Show Less",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xff1A2125), fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (state.showMore) {
                      diaryCardBloc.add(ShowToggleEvent(false));
                    } else {
                      diaryCardBloc.add(ShowToggleEvent(true));
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}
