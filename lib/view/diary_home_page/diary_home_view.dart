import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/db/models/diary_card.dart';
import 'package:training_app/db/repo/diary_card_repository.dart';
import 'package:training_app/view/diary_home_page/diary_home_bloc.dart';
import 'package:training_app/view/diary_home_page/diary_home_event.dart';
import 'package:training_app/view/diary_home_page/widgets/diary_card_page/diary_card_provider.dart';
import 'diary_home_bloc.dart';
import 'diary_home_state.dart';

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
      if (!this._title.isEmpty && !this._description.isEmpty) {
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
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Material(
                  color: Colors.transparent,
                  child: BlocBuilder<DiaryHomeBloc, DiaryHomeState>(
                      builder: (context, state) {
                    return TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        fillColor: Color(0xff2E97DC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
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
                    );
                  }),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Material(
                  color: Colors.transparent,
                  child: BlocBuilder<DiaryHomeBloc, DiaryHomeState>(
                      builder: (context, state) {
                    return TextField(
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
                    );
                  }),
                ),
              ),
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
                buildWhen: (pre, current) =>
                !identical(pre.diaryCard, current.diaryCard),///
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
