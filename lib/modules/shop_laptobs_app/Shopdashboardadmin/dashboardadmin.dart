import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';

import '../../../shared/components/components.dart';
import '../shop_login/shop_login_screen.dart';
class dashboardadmin extends StatelessWidget {
  const dashboardadmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
        builder: (context, state){
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Dashboard"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20),),
                      backgroundColor: Colors.black,

                    ),
                    onPressed: (){
                      ShopCubit.get(context).currentIndex=0;
                      navigateAndFinish(
                        context,
                        ShopLoginScreen(),
                      );
                    },
                    child: Text("Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.currentIndex ,
              selectedItemColor: Colors.black,
              onTap: (index) {
                cubit.changeBottomNavBar(index);

              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.laptop_windows_sharp),
                  label: "Laptops",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.groups),
                  label: "Users",
                ),

              ],

            ),
            body:cubit.dashscreen[cubit.currentIndex] ,
          );
        }
    );
  }
}
