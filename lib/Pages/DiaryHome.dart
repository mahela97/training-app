import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryHome extends StatefulWidget {
  @override
  _DiaryHomeState createState() => _DiaryHomeState();
}

class _DiaryHomeState extends State<DiaryHome> {
  final titleController = TextEditingController();
  final descripController = TextEditingController();
  String title;
  String description;

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
    print(this.title);
    print(this.description);
    titleController.clear();
    descripController.clear();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff149CDF),
      ),
      width: deviceInfo.size.width,
      height: deviceInfo.size.height,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                    borderSide: BorderSide(color:Colors.white),
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
            width: 300,
            margin: EdgeInsets.all(10),
            child: Material(
              color: Color(0xff149CDF),
              child: TextField(

                controller: this.descripController,
                decoration: InputDecoration(
                  fillColor: Color(0xff2E97DC),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[800]),
                  hintText: " Enter Description",
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
                  backgroundColor:MaterialStateProperty.all<Color>(Color(0xff0075EB)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            )))),
          )
        ],
      ),
    );
  }
}
