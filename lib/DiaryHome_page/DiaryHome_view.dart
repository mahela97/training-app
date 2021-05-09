import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DiaryHome_bloc.dart';
import 'DiaryHome_state.dart';

class DiaryHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("building");
    // ignore: close_sinks
    final _diaryHomeBloc = BlocProvider.of<DiaryHomeBloc>(context);
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();
    String _title = "";
    String _description = "";

    void changeTitle(text) {
      _title = text;
    }

    void changeDescription(text) {
      _description = text;
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
              Container(
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
                    ),
                    onChanged: (text) => changeTitle(text),
                  ),
                ),
              ),
              Container(
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
                    ),
                    onChanged: (text) => changeDescription(text),
                  ),
                ),
              ),
              SizedBox(
                  child: ElevatedButton(
                    child: Text("Submit"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff0075EB)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
              ))
            ],
          ),
        ),
      ),
    );
    // ignore: close_sinks
  }
}
