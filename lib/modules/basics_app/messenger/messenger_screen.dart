import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

final List <Color> colorList =[
  Colors.blue,
  Colors.black,
  Colors.red,
  Colors.amber,
  Colors.blueAccent,
  Colors.deepPurpleAccent,
  Colors.tealAccent,
  Colors.teal,
  Colors.lightGreenAccent,
];

final List<String> nameList =[
  "Mais",
  "Ali",
  "Tala",
  "Reem",
  "Mera",
  "Mahmoud",
  "Majd",
  "Abeer",
  "Lojeen",
];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:CircleAvatar(
          backgroundColor: Colors.grey[300],
         child: Icon(
            Icons.list,
           size: 30,
          ),
        ),
        title: const Text("Chats"),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: IconButton(onPressed: (){},
              icon: Icon( Icons.edit),
            ),
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    SizedBox(
                      width: 20,
                    ),
                    const Text("search"),
                  ],
                ),
                ),
              SizedBox(
                height: 20,
              ),
             Container(
               height: 100,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                   itemBuilder:(context, index) => Row(
                 children: [
                   Container(
                     width:60 ,
                     child: Column(
                       children: [
                         Stack(
                           alignment: AlignmentDirectional.bottomEnd,
                           children: [
                             CircleAvatar(
                               radius: 30,
                               backgroundColor: colorList[index] ,
                             ),
                             CircleAvatar(
                               radius: 9,
                               backgroundColor: Colors.white,
                             ),
                             Padding(
                               padding: const EdgeInsetsDirectional.only(
                                 bottom: 2,
                                 end: 2,
          
                               ),
                               child: CircleAvatar(
                                 radius: 7,
                                 backgroundColor: Colors.green,
                               ),
                             ),
                           ],
                         ),
                         Text(nameList[index],
                           maxLines: 1,
                         ),
          
                       ],
                     ),
                   ),
                 ],
               ),
                   separatorBuilder: (context, index) =>SizedBox(
                     width: 20,
                   ) ,
                   itemCount: colorList.length),
             ) ,
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: colorList[index] ,
                      ),
                      CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          bottom: 2,
                          end: 2,
          
                        ),
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(nameList[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          
                      Row(
                        children: [
                          const  Text("Hi I am Negan"),
                          SizedBox(
                            width: 20,
                          ),
                          const  Text("5:01 pm"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                  itemCount:colorList.length ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
