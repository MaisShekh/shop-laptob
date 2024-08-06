import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/modules/shop_laptobs_app/Shopdashboardadmin/laptop/addlap.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_login/shop_login_screen.dart';

import '../../../shared/components/components.dart';
import 'laptop/alllap.dart';

class Laptops extends StatelessWidget {
  const Laptops({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              SizedBox(
                height:35,
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                    context,
                    addlap(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.laptop_chromebook_outlined,),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Add Laptop",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              SizedBox(
                height:35,
              ),
              InkWell(
                onTap: (){
                  navigateTo(
                    context,
                    alllap(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.edit_road_outlined,),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Update Laptop",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),

              SizedBox(
                height:150,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  ShopCubit.get(context).currentIndex=0;
                  navigateAndFinish(
                    context,
                    ShopLoginScreen(),
                  );

                },
                  child: Text("Sign Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20),),
                    backgroundColor: Colors.black,

                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
