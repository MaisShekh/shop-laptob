import 'package:flutter/material.dart';

class PlayerInfoScreen extends StatelessWidget {

  String name;
  String team;
  String image;
  int age;

  PlayerInfoScreen({
    required this.image,
    required this.name,
    required this.team,
    required this.age,

});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Player Information",
          style: TextStyle(
            color: Colors.white,
          ),

        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(image)),
            Text("Name: $name",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            Text("Team: $team",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            Text("Age: $age",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),

          ],
        ),
      ),
    );
  }
}
