import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/modules/player_app/players/players_screen.dart';
import 'package:untitled/shared/components/components.dart';

class OnBoardingPlayerScreen extends StatelessWidget {


  var pageviewController =PageController();
  bool islast =false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
           ElevatedButton(onPressed: ()
           {
             navigateTo(
                 context,
                 PlayersScreen());
           },
               child: Text("SKIP",
               style: TextStyle(
                 color: Colors.white,
               ),
               ),
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
             ),
           )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageviewController,
                onPageChanged: (int index) {
                 if(index == 2)
                 {
                print("last");
                islast =true;
                 }
                },
                itemBuilder: (context, index) => buildItemPageView() ,
                itemCount: 3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(onPressed: ()
                {
                  if(islast)
                  {
                    navigateTo(
                        context,
                        PlayersScreen());
                    islast =false;
                  }
                  else
                  {
                    pageviewController.nextPage(duration: Duration(milliseconds: 750),
                      curve: Curves.linearToEaseOut,);

                  }

                },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  color: Colors.white,
                  ),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemPageView() => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded
          (child: Image(image:AssetImage("images/leomessi.jpg"))),
        Text("List Of The Best Players In The World",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Sub Title"),
      ],
    ),
  );

}
