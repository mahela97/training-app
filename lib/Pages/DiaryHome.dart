import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_app/DiaryCard/DiaryCard.dart';

class DiaryHome extends StatefulWidget {
  @override
  _DiaryHomeState createState() => _DiaryHomeState();
}

class _DiaryHomeState extends State<DiaryHome> {
  final titleController = TextEditingController();
  final descripController = TextEditingController();
  String title = "";
  String description = "";
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  List<DiaryCard> cards = [];
  bool validateTitle = false;
  bool validateDescrip = false;

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descripController.dispose();
  }

  void changeTitle(text) {
    this.title = text;
  }

  void changeDescription(text) {
    this.description = text;
  }

  void onSubmit() {
    titleController.clear();
    descripController.clear();
    if (this.title.isEmpty || this.description.isEmpty) {
      setState(() {
        this.title.isEmpty ? validateTitle = true : validateTitle = false;
        this.description.isEmpty
            ? validateDescrip = true
            : validateDescrip = false;
      });
    } else {
      validateDescrip = false;
      validateTitle = false;
    }
    if (!validateTitle && !validateDescrip) {
      setState(() {
        mainAxisAlignment = MainAxisAlignment.start;
        cards.add(DiaryCard(
            title: this.title,
            subtitle: "mahela",
            description: this.description,
            cardColor: Color(0xffB3E9FE)));
      });
      this.title = "";
      this.description = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    //MediaQueryData deviceInfo = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xff149CDF), //Color(0xff149CDF)
          ),
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.all(10),
                  child: Material(
                    color: Color(0xff149CDF),
                    child: TextField(
                      controller: this.titleController,
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
                        errorText:
                            validateTitle ? 'Value Can\'t Be Empty' : null,
                      ),
                      onChanged: (text) => changeTitle(text),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(10),
                  child: Material(
                    color: Color(0xff149CDF),
                    child: TextField(
                      maxLines: 3,
                      controller: this.descripController,
                      decoration: InputDecoration(
                        fillColor: Color(0xff2E97DC),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: " Enter Description",
                        errorText:
                            validateDescrip ? 'Value Can\'t Be Empty' : null,
                      ),
                      onChanged: (text) => changeDescription(text),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      onPressed: onSubmit,
                      child: Text("Submit"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff0075EB)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )))),
                ),
                Container(
                  child: Column(
                    children: cards,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
