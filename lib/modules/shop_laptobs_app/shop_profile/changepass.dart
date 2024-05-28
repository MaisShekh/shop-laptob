import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../layout/shop_laptobs_app/cubit/cubit.dart';
import '../../../layout/shop_laptobs_app/cubit/states.dart';
import '../../../layout/shop_laptobs_app/shop_laptobs_layout.dart';
import '../../../shared/components/components.dart';

class changpass extends StatelessWidget {
TextEditingController passwordController=TextEditingController();
TextEditingController passwordConfirmController=TextEditingController();
var formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){
        if(state is updatepasssuccessstate ) {
          ShopCubit.get(context).currentIndex=2;
          navigateAndFinish(context, ShopLaptobsLayout());
          Fluttertoast.showToast(
            msg: "Update Success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
        if(state is updatepasserrorstate){
          Fluttertoast.showToast(
            msg: "Update Error",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      },
        builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text("Change Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:25,
              ),
            ),
          ),
          body: Stack(
            children: [
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Change Your Password",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text("Input New Password",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller:passwordController ,
                        keyboardType: TextInputType.text,
                        validator: ( value)
                        {
                          if(value!.length < 6)
                          {
                            return "Password is Short";
                          }

                          return null;

                        },
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.lock_outline),
                          ),
                          hintText: "Create Password",
                        ),
                        obscureText: ShopCubit.get(context).isPassword,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller:passwordConfirmController ,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ShopCubit.get(context).isPassword,
                        validator: (String? value) {
                          if (value! != passwordController.text) {
                            return "Password does not Match";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.lock_outline),
                          ),
                          hintText: "Confirm Password",
                          suffix: IconButton(
                            onPressed: ()
                            {
                              ShopCubit.get(context).changePasswordIcon();
                            },
                            icon: Icon(ShopCubit.get(context).suffixIcon),

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(onPressed: ()
                        {
                          if(formkey.currentState!.validate())
                          {
                            ShopCubit.get(context).updatepassword(
                                newpassword: passwordController.text

                            );

                          }
                        },
                          child: Text("Update",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
              Visibility(
                visible:state is updatepassloadingstate ,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color:Colors.black12.withOpacity(0.3),
                  child: Center(
                    child: SpinKitChasingDots(color:Colors.blue),
                  ),
                ),),
            ],
          ),
        );
        },);
  }
}
