import 'package:flutter/material.dart';

class HomeScreen  extends StatelessWidget {
  const HomeScreen({super.key});

@override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Barca Team'
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading : const Icon(Icons.list),
        actions: [
          IconButton(onPressed: () {
            print("barca");
          },
              icon:const Icon(Icons.search),)
        ],
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        width: double.infinity,
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text('messi',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 30,
                 ),
              ),
               Text('gavi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
               Text('pedri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
               Text('gundougan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
               Text('lamin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
               Text('de young',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
               Text('roki',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
               Text('cobarsi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('messi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('gavi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('pedri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('gundougan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('lamin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('de young',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('roki',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('cobarsi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('messi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('gavi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('pedri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('gundougan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('lamin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('de young',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('roki',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('cobarsi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text('GUNDOUGAN IS YOUR UNCLE',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

}


