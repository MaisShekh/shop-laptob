import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_login/shop_login_screen.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_profile/changepass.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_profile/personal_info_screen.dart';
import 'package:untitled/shared/components/components.dart';

class ShopProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black,
                ),
                InkWell(
                  onTap: (){
                    navigateTo(
                      context,
                      PersonalInfoScreen(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person_outlined,),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Personal Info",
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
                InkWell(
                  onTap: (){
                    navigateTo(
                      context,
                      changpass(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock_outline,),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Change Password",
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
                InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.list_alt_outlined,),
                        SizedBox(
                          width: 20,
                        ),
                        Text("My Addresses",
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
        );
      },
    );
  }
}
