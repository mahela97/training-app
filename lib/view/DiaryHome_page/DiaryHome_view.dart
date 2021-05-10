import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/db/models/DiaryCard.dart';
import 'package:training_app/db/repo/DiaryCardRepository.dart';
import 'package:training_app/widgets//DiaryCard_page/DiaryCard_page.dart';
import 'package:training_app/view/DiaryHome_page/DiaryHome_page.dart';

import 'DiaryHome_bloc.dart';
import 'DiaryHome_state.dart';

class DiaryHomeView extends StatefulWidget {
  const DiaryHomeView({Key key}) : super(key: key);

  @override
  _DiaryHomeViewState createState() => _DiaryHomeViewState();
}

class _DiaryHomeViewState extends State<DiaryHomeView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _title = "";
  String _description = "";

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  void changeTitle(text) {
    _title = text;
  }

  void changeDescription(text) {
    _description = text;
  }

  @override
  Widget build(BuildContext context) {
    final diaryCardRepository = DiaryCardRepository();

    final homeDiaryBloc = BlocProvider.of<DiaryHomeBloc>(context);

    void onSubmit() {
      _titleController.clear();
      _descriptionController.clear();
      if (this._title.isEmpty || this._description.isEmpty) {
        if (this._title.isEmpty) {
          homeDiaryBloc.add(ValidateTitleEvent(true));
        } else {
          homeDiaryBloc.add(ValidateTitleEvent(false));
        }
        if (this._description.isEmpty) {
          homeDiaryBloc.add(ValidateDescriptionEvent(true));
        } else {
          homeDiaryBloc.add(ValidateDescriptionEvent(false));
        }
      } else {
        homeDiaryBloc.add(ValidateTitleEvent(false));
        homeDiaryBloc.add(ValidateDescriptionEvent(false));
      }
      if (!homeDiaryBloc.state.validateDescrip &&
          !homeDiaryBloc.state.validateTitle) {
        diaryCardRepository.add(
            item: DiaryCard(
                this._title, "Mahela", this._description, "0xffB3E9FE"));
        this._title = "";
        this._description = "";
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/Images/wallpaper.jpg"), fit: BoxFit.fill),
        ),
        height: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<DiaryHomeBloc, DiaryHomeState>(
                  builder: (context, state) {
                return Container(
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        fillColor: Color(0xff2E97DC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: " Submit New",
                        errorText: state.validateTitle
                            ? 'Value Can\'t Be Empty'
                            : null,
                      ),
                      onChanged: (text) => changeTitle(text),
                    ),
                  ),
                );
              }),
              BlocBuilder<DiaryHomeBloc, DiaryHomeState>(
                  builder: (context, state) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      maxLines: 3,
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        fillColor: Color(0xff2E97DC),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: " Enter Description",
                        errorText: state.validateDescrip
                            ? 'Value Can\'t Be Empty'
                            : null,
                      ),
                      onChanged: (text) => changeDescription(text),
                    ),
                  ),
                );
              }),
              SizedBox(
                  child: ElevatedButton(
                onPressed: onSubmit,
                child: Text("Submit"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
              )),
              BlocBuilder<DiaryHomeBloc, DiaryHomeState>(
                builder: (context, state) {
                  final cards = state.diaryCard
                      .map((card) =>
                          DiaryCardProvider(card.title, card.description))
                      .toList();
                  return Column(
                    children: cards,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
    // ignore: close_sinks
  }
}
