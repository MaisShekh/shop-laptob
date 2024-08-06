import 'package:flutter/material.dart';
import 'package:untitled/modules/player_app/playerinfo/playerinfo_screen.dart';

class Players {
  String name;
  String team;
  String image;
  int age;

  Players({
    required this.image,
    required this.name,
    required this.team,
    required this.age,
});

}


class PlayersScreen extends StatelessWidget {

  List<Players> playersInfo =[
     Players(image: "images/leomessi.jpg",
         name: """ The Legend 
             Leo Messi""" ,
         team: "Inter Miami",
         age: 36),

    Players(image: "images/gavi.jpg",
        name: "Pablo Gavi",
        team: "Barcelona",
        age: 19),

    Players(image: "images/gundogan.jpg",
        name: "Ilkay Gundogan",
        team: "Barcelona",
        age: 33),

    Players(image: "images/debruyne.jpg",
        name: "Kevin De Bruyne",
        team: "Man City",
        age: 32),

    Players(image: "images/lewa.jpg",
        name: """Robert
             Lewandowski""",
        team: "Barcelona",
        age: 35),

    Players(image: "images/cancelo.jpg",
        name: "Joao Cancelo",
        team: "Barcelona",
        age: 29),


  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Players",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,

      ),
      body:GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
          itemCount: playersInfo.length,
          itemBuilder: (context, index) {
       Players playersinfo = playersInfo[index];
         return GestureDetector(
           onTap: (){

             Navigator.push(context,
                 MaterialPageRoute(
                     builder:(context) => PlayerInfoScreen(
                         image: playersinfo.image,
                         name: playersinfo.name ,
                         team: playersinfo.team,
                         age: playersinfo.age),
                 ),
             );
           },
           child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0),
               ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: AssetImage(playersinfo.image,
                  ),
                  fit: BoxFit.cover,

                ),
              ),
           ),
         );
          },
      ),
    );
  }
}
