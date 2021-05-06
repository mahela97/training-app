// TODO Implement this library.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final Color cardColor;

  DiaryCard({this.title, this.subtitle, this.description, this.cardColor});

  @override
  _DiaryCardState createState() => _DiaryCardState();
}

class _DiaryCardState extends State<DiaryCard> {
  int maxLines = 3;
  bool isVisible = false;
  String showToggle = "Show More";

  void showMore() {
    if (isVisible) {
      setState(() {
        maxLines = 3;
        isVisible = false;
        showToggle = "Show More";
      });
    } else {
      setState(() {
        isVisible = true;
        maxLines = 10;
        showToggle = "Show Less";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData deviceInfo = MediaQuery.of(context);
    return Container(
      width: deviceInfo.size.width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.cardColor,
        border: Border.all(width: 4, color: Color(0xff009FE0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              widget.title,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(5),
              child: Text(widget.subtitle,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff668490),
                    decoration: TextDecoration.none,
                    fontSize: 20,
                  ))),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(widget.description,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
                textAlign: TextAlign.left,
                maxLines: this.maxLines),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextButton(
                child: Text(
                  showToggle,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color(0xff1A2125), fontWeight: FontWeight.bold),
                ),
                onPressed: showMore),
          ),
        ],
      ),
    );
  }
}
