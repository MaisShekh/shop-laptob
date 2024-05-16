import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget buildTasksItem(Map tasks) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
          Text("${tasks["tasks"]}"),
          SizedBox(
            width: 15,
          ),
      Text("${tasks["date"]}",
        style: TextStyle(
          color: Colors.grey[500],
        ),
      ),
    ],
  ),
);

void navigateTo(context,widget) => Navigator.push
  (
    context,
    MaterialPageRoute(
        builder:(context) => widget,
    ),
);

void navigateAndFinish(context,widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder:(context) => widget,
    ),
        (route) => false,
);







