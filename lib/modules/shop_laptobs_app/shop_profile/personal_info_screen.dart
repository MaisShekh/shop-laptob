import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/models/shop_app/shop_users_models.dart';

class PersonalInfoScreen extends StatelessWidget {


  var emailController =TextEditingController();
  var firstNameController =TextEditingController();
  var lastNameController =TextEditingController();
  var phoneController =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
     listener: (context, state) {
       if(state is ShopGetUserSuccessState ) {

         Fluttertoast.showToast(
           msg: "Update Success",
           toastLength: Toast.LENGTH_LONG,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 5,
           backgroundColor: Colors.lightGreen,
           textColor: Colors.white,
           fontSize: 16,
         );}
     },
      builder: (context, state) {

       ShopUserModel userModel=ShopCubit.get(context).userModel!;
       emailController.text=userModel.email!;
       firstNameController.text =userModel.firstName!;
       lastNameController.text =userModel.lastName!;
       phoneController.text =userModel.phone!;

       return  Scaffold(
         appBar: AppBar(
           title: Text("Personal Info",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize:25,
             ),
           ),
         ),
         body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(40.0),
             child: Column(
               children: [
                 TextFormField(
                   controller: emailController,
                   decoration: InputDecoration(
                     label:Text("Email",
                       style: TextStyle(
                         color:  Colors.black,
                       ),
                     ) ,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.black,
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.black,
                       ),
                     ),

                   ),

                 ),
                 SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   controller: firstNameController,
                   decoration: InputDecoration(
                     label:Text("First Name",
                       style: TextStyle(
                         color:  Colors.black,
                       ),
                     ) ,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.black,
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.black,
                       ),
                     ),

                   ),

                 ),
                 SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   controller: lastNameController,
                   decoration: InputDecoration(
                     label:Text("Last Name",
                       style: TextStyle(
                         color:  Colors.black,
                       ),
                     ) ,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.black,
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.black,
                       ),
                     ),

                   ),

                 ),
                 SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   controller: phoneController,
                   decoration: InputDecoration(
                     label:Text("Phone",
                       style: TextStyle(
                         color:  Colors.black,
                       ),
                     ) ,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.black,
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(
                         color: Colors.black,
                       ),
                     ),

                   ),

                 ),
                 SizedBox(
                   height: 40,
                 ),
                 Container(
                   width: double.infinity,
                   height: 50,
                   child: ElevatedButton(onPressed: ()
                   {
                     ShopCubit.get(context).updateUser(
                         firstName: firstNameController.text,
                         lastName: lastNameController.text,
                         phone: phoneController.text);
                   },
                     child: Text("Update",
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
      },
    );
  }
}
