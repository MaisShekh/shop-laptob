import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/shop_laptobs_layout.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_login/shop_login_screen.dart';
import 'package:untitled/shared/components/components.dart';

import '../../../layout/shop_laptobs_app/cubit/states.dart';

class ShopRegisterScreen extends StatelessWidget {

  var emailRegController =TextEditingController();
  var passwordRegController =TextEditingController();
  var passwordConfirmRegController =TextEditingController();
  var forKeyReg =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
     listener: (context, state) {
       if(state is ShopRegisterSuccessState)
         {
           Fluttertoast.showToast(
             msg: "Sign Up Successfully",
             backgroundColor: Colors.green,
             textColor: Colors.white,
           );
           navigateAndFinish(
               context,
             ShopLoginScreen(),
           );
         }
       if(state is ShopRegisterErrorState)
       {
         Fluttertoast.showToast(
           msg:state.error,
           toastLength: Toast.LENGTH_LONG,
           gravity: ToastGravity.TOP,
           timeInSecForIosWeb: 5,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16,

         );
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
                 key: forKeyReg,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(
                       width: double.infinity,
                       child: Column(
                         children: [
                           Text("Register to join us",
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
                       controller:emailRegController ,
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
                         prefix: Padding(
                           padding: const EdgeInsets.only(right: 8.0),
                           child: Icon(Icons.email_outlined),
                         ),
                         hintText: "Email",
                       ),
                     ),
                     SizedBox(
                       height: 15,
                     ),
                     TextFormField(
                       controller:passwordRegController ,
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
                       controller:passwordConfirmRegController ,
                       keyboardType: TextInputType.visiblePassword,
                       obscureText: ShopCubit.get(context).isPassword,
                       validator: (String? value) {
                         if (value! != passwordRegController.text) {
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
                       height: 30,
                     ),
                   ConditionalBuilder(
                       condition: state is! ShopRegisterLoadingState,
                       builder: (context) =>Container(
                         width: double.infinity,
                         height: 50,
                         child: ElevatedButton(onPressed: ()
                         {
                           if(forKeyReg.currentState!.validate())
                           {
                             ShopCubit.get(context).userRegister(
                               email: emailRegController.text,
                               password: passwordRegController.text,
                               passwordConfirm: passwordConfirmRegController.text,
                             );

                           }
                         },
                           child: Text("Register",
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
                         Text("Have an account?",
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
                               ShopLoginScreen(),
                             );
                           },
                           child: Text("Login",
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
