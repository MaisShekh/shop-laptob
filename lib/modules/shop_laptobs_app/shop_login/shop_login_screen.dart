import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/layout/shop_laptobs_app/shop_laptobs_layout.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_home/shop_home_screen.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_register/shop_register_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

import '../../../layout/shop_laptobs_app/cubit/cubit.dart';

class ShopLoginScreen extends StatelessWidget {

  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var forKeyLog =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {
        if(state is ShopLoginErrorState)
        {
          Fluttertoast.showToast(
            msg:state.error,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,

          );
        }

        if(state is ShopGetUserSuccessState ) {

          Fluttertoast.showToast(
            msg: "Login Success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16,
          );

          navigateAndFinish(
            context,
            ShopLaptobsLayout(),
          );

          ShopCubit.get(context).getLaptobData();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: forKeyLog,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text("Welcome Back",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height:10 ,
                            ),
                            Text("Welcome Back! Please enter your details.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller:emailController ,
                        keyboardType: TextInputType.emailAddress,
                        validator: ( value)
                        {
                          if(value!.isEmpty)
                          {
                            return "Email Must Not Be Empty";
                          }

                          return null;

                        },
                        decoration: InputDecoration(
                          prefix: Icon(Icons.email_outlined),
                          hintText: "Email",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller:passwordController ,
                        keyboardType: TextInputType.text,
                        obscureText: ShopCubit.get(context).isPassword,
                        validator: ( value)
                        {
                          if(value!.isEmpty)
                          {
                            return "Password is Short";
                          }

                          return null;

                        },
                        decoration: InputDecoration(
                          prefix: Icon(Icons.lock_outline),
                          hintText: "Password",
                          suffix: IconButton(
                            onPressed: ()
                            {
                              ShopCubit.get(context).changePasswordIcon();
                            },
                            icon:Icon(ShopCubit.get(context).suffixIcon) ,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopGetUserLoadingState,
                          builder: (context) =>  Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(onPressed: ()
                            {
                              if(forKeyLog.currentState!.validate())
                              {

                                ShopCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }

                            },
                              child: Text("Login",
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
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          TextButton(
                            onPressed: ()
                            {
                              navigateAndFinish(
                                context,
                                ShopRegisterScreen(),
                              );
                            },
                            child: Text("Register",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        );
      },
    );
  }
}
