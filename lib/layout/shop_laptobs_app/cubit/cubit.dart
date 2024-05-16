import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/models/shop_app/shop_cart_models.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';
import 'package:untitled/models/shop_app/shop_users_models.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_cart/shop_cart_screen.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_home/shop_home_screen.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_profile/shop_profile_screen.dart';
import 'package:untitled/shared/components/constants.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit(): super(ShopInitialState());

  static ShopCubit get(context) =>BlocProvider.of(context);

  int currentIndex =0;

  List<Widget> screen =
  [
    ShopHomeScreen(),
    ShopCartScreen(),
    ShopProfileScreen(),
  ];

  List<AppBar> changeAppBar =
  [
    AppBar(
      leading:
      Row(
        children: [
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.list,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),

      actions: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.black,
          child: IconButton(onPressed: (){},
            icon: Icon( Icons.search,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),

      ],
    ),
    AppBar(
     title:Text("Items In Cart",
       style: TextStyle(
         fontWeight: FontWeight.bold,
       ),
     ),
   ),
    AppBar(),
  ];

  ///////////////////////////////  REGISTER   //////////////////////

  Future<void>  userRegister({
    required String email,
    required String password,
    required String passwordConfirm,

  }) async
  {
    emit(ShopRegisterLoadingState());

    await FirebaseAuth
        .instance
        .createUserWithEmailAndPassword
      (
      email: email,
      password: password,
    )
        .then((value) async {

      await userCreate(
        email: email,
        userId: value.user!.uid,

      );

      emit(ShopRegisterSuccessState());
    })
        .catchError((error){
      print("error: $error ");
      emit(ShopRegisterErrorState(error.toString()));
    });
  }


  Future<void>  userCreate({
    required String email,
    required String userId,
  }) async
  {

    ShopUserModel model =ShopUserModel(
      email: email,
      userId: userId,
      firstName: "",
      lastName: "",
      phone: "",
    );

    await FirebaseFirestore
        .instance
        .collection("users")
        .doc(userId)
        .set(model.toMap())
        .then((value)
    {
      emit(ShopCreateUserSuccessState());
    });
  }


  bool isPassword=true;
  IconData suffixIcon =Icons.visibility_off_outlined;

  void changePasswordIcon()
  {
    isPassword= !isPassword;
    suffixIcon= isPassword? Icons.visibility_off_outlined:Icons.visibility_outlined ;
    emit(ShopChangePasswordIconState());
  }


  //////////////////////////////////////  LOGIN ///////////////////////////

  Future<void> userLogin({
    required String email,
    required String password,
  }) async
  {
     emit(ShopLoginLoadingState());

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {

      userId=value.user!.uid;
      //emit(ShopLoginSuccessState());
      //getLaptobData();
      getUserData();



    })
        .catchError((error){
      print("error: $error ");
      emit(ShopLoginErrorState(error.toString()));
    });
  }


  ////////////////////////////////////////////////////////

   ShopUserModel ? userModel ;

  Future<void> getUserData()
  async {
    emit(ShopGetUserLoadingState());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get()
        .then((value)
    {
      userModel=ShopUserModel.fromJson(value.data()!);
      print(value.data()!);
      emit(ShopGetUserSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ShopGetUserErrorState());
    });
  }

  Future<void> updateUser({
    required String firstName,
    required String lastName,
    required String phone,
})async
  {

    ShopUserModel model =ShopUserModel(
      email: userModel!.email,
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .update(model.toMap())
        .then((value) {
          getUserData();
    })
        .catchError((error){});
  }


  List<ShopLaptobModel> laptobModel =[];


  Future<void> getLaptobData()
  async {
    emit(ShopGetLaptobLoadingState());
    await FirebaseFirestore.instance
        .collection("laptobs")
        .get()
        .then((value)
    {
      value.docs.forEach((element) {
        print(element.data());
        //laptobId.add(element.id);
        laptobModel.add(ShopLaptobModel.fromJson(element.data()));
        print(ShopLaptobModel.fromJson(element.data()));
      });
      emit(ShopGetLaptobSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ShopGetLaptobErrorState());
    });
  }

  List <ShopCartModel> cart=[];

   Future<void> addToCart({required String laptobId}) async
  {


    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("cart")
        .doc(laptobId)
        .set({})
        .then((value) {

          emit(ShopAddToCartSuccessState());

    })
        .catchError((error){
          emit(ShopAddToCartErrorState());
    });
  }

  List<String> laptobId =[];
  ShopCartModel ? cartModel;

  Future<void> createCart() async
  {
    ShopCartModel cartModel =ShopCartModel(
      cartId: userId,
      numberOfItem: 0,
      totalPrice: 0,
      laptobId: laptobId,
    );

    FirebaseFirestore.instance
    .collection('cart')
    .doc(userId)
    .set(cartModel.toMap())
        .then((value) {})
        .catchError((error){});
  }

 /* Future<void> changePassword ({required String password}) async
  {
   await FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
   user.updatePassword(password);

  }*/

  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    emit(ShopChangeBottomNavBarState());

  }




}