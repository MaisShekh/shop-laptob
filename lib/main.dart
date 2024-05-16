import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/layout/shop_laptobs_app/shop_laptobs_layout.dart';
import 'package:untitled/layout/todo_app/home_layout_screen.dart';
import 'package:untitled/modules/player_app/on_boarding_player/on_boarding_player_screen.dart';
import 'package:untitled/modules/player_app/players/players_screen.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_home/shop_home_screen.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_login/shop_login_screen.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';





import 'shared/bloc_observer.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  Platform.isAndroid ?
   await Firebase.initializeApp(
    options:const FirebaseOptions(
        apiKey: "AIzaSyCxGJF49F2zLSt4fpftozpdMTRfixFE7VI",
        appId: "1:70150984781:android:322edaf373248ebc50b804",
        messagingSenderId: "70150984781",
        projectId: "shop-laptobs",
    ))
  :await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>ShopCubit(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: ShopLoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}



