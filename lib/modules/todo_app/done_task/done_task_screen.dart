import 'package:flutter/material.dart';

class DoneTaskScrren extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("done task",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
