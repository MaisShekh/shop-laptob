import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/models/shop_app/shop_cart_models.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';
import 'package:untitled/models/shop_app/shop_users_models.dart';
import 'package:untitled/modules/shop_laptobs_app/Shopdashboardadmin/laptops.dart';
import 'package:untitled/modules/shop_laptobs_app/Shopdashboardadmin/users.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_cart/shop_cart_screen.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_home/shop_home_screen.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_profile/shop_profile_screen.dart';
import 'package:untitled/shared/components/constants.dart';

import '../../../shared/components/components.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit(): super(ShopInitialState());

  static ShopCubit get(context) =>BlocProvider.of(context);

  int currentIndex =0;
  File? lapimg;
  XFile? pickedFile;

  String Laptopimage = '';
  var picker = ImagePicker();


  List<Widget> screen =
  [
    ShopHomeScreen(),
    ShopCartScreen(),
    ShopProfileScreen(),
  ];
  List<Widget> dashscreen=[
    Laptops(),
    Users(),
  ];
  void settype(String val,String type) {
    type = val;
    emit(typestate());
  }
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
     title:Text("Items In Cart:",
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
      await createCart();

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
        .then((value) async {

      userId=value.user!.uid;
      //emit(ShopLoginSuccessState());
      //getLaptobData();
      await getUserData();



    })
        .catchError((error){
      print("error: $error ");
      emit(ShopLoginErrorState(error.toString()));
    });
  }


  ////////////////////////////////////////////////////////



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
    emit(updateuserloadingstate());
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
        .then((value) async {
          emit(updateusersuccessstate());
          await getUserData();
    })
        .catchError((error){
          emit(updateusererrorstate());
    });
  }
  Future<void> updatepassword({required String newpassword})
  async{
    emit(updatepassloadingstate());
    User? user = await FirebaseAuth.instance.currentUser;
    await user!.updatePassword(newpassword)
    .then((value) {
      emit(updatepasssuccessstate());
    })
    .catchError((error){
      emit(updatepasserrorstate());
    });
  }

  Future<void> recoverpass({
    required String email,
  })async {
    emit(recoverloadstate());
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email)
        .then((value) {
      emit(recoversuccessstate());
    })
        .catchError((error){

      emit(recovererrorstate());
    });
  }





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






  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    emit(ShopChangeBottomNavBarState());

  }

  Future<void> getImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      lapimg = File(pickedFile.path);
      emit(addimagesuccessstate());
    } else {
      emit(addimageerrorstate());
    }
  }

  Future<void> resetImage() async {
    lapimg = null;
  }
  Future<void> addlap({
    required String lapname,
    required String lapdesc,
    required String Ram,
    required int price,
    required String hardsize,
    required String brand,
    required String hardtype,
  }) async {

    emit(addlaploadingstate());
    String lapid= await FirebaseFirestore.instance
        .collection('laptops').doc().id;
    await FirebaseFirestore.instance
        .collection('laptops').doc(lapid)
        .set({
      "name": lapname ?? " ",
      "description": lapdesc ?? '',
      "ram": Ram,
      "price": price,
      "image":'https://firebasestorage.googleapis.com/v0/b/shop-laptobs.appspot.com/o/defimg.jpeg?alt=media&token=564a4c5d-64c3-4a0f-b793-84810ba82a1a',
      "laptobId": lapid,
      "hardsize":hardsize,
      'brand':brand,
      'hardtype':hardtype,
    })
        .then((value) {
      emit(addlapsuccessstate());
    }).catchError((error) {
      emit(addlaperrorstate());
      Fluttertoast.showToast(msg: "error add",backgroundColor: Colors.red);
    });
  }



  Future<void> uploadlapimg() async {

    await fs.FirebaseStorage.instance
        .ref()
        .child('laptops/${Uri.file(lapimg!.path).pathSegments.last}')
        .putFile(lapimg!)
        .then((value) async {
      await value.ref.getDownloadURL().then((value) {
        Laptopimage = value;
        emit(uploadimagesuccessstate());
      }).catchError((error) {
        emit(uploadimageerrorstate());
        Fluttertoast.showToast(msg: 'error was occured',backgroundColor: Colors.red);
      });
    }).catchError((error) {
      emit(uploadimageerrorstate());
      Fluttertoast.showToast(msg: 'error was occured',backgroundColor: Colors.red);
    });
  }
  Future<void> addlapwithimage({
    required String lapname,
    required String lapdesc,
    required String Ram,
    required int price,
    required String hardsize,
    required String brand,
    required String hardtype,
  }) async {
    emit(addlaploadingstate());
    await uploadlapimg();
    String lapid= await FirebaseFirestore.instance
        .collection('laptops').doc().id;
    await FirebaseFirestore.instance
        .collection('laptops').doc(lapid)
        .set({
      "name": lapname ?? " ",
      "description": lapdesc ?? '',
      "ram": Ram,
      "price": price,
      'image':Laptopimage,
      "laptobId": lapid,
      "hardsize":hardsize,
      'brand':brand,
      'hardtype':hardtype,
    })
        .then((value) {
      emit(addlapsuccessstate());
    })
        .catchError((error) {
      emit(addlaperrorstate());
      Fluttertoast.showToast(msg: 'error was occured',backgroundColor: Colors.red);
    });
  }

  late List<ShopLaptobModel> laps = [];
  Future<void> getlaps() async {
    laps = [];
    emit(findlaploadstate());
    await FirebaseFirestore.instance
        .collection('laptops')
        .get()
        .then((value) {
      value.docs.forEach((element) async {
        laps.add(ShopLaptobModel.fromJson(element.data()));
      });
      emit(findlapsuccessstate());
    }).catchError((error) {
      emit(findlaperrorstate());
    });
  }

  Future<void> updatelap({
    required String id,
    required String image,
    required String lapname,
    required String lapdesc,
    required String Ram,
    required int price,
    required String hardsize,
    required String brand,
    required String hardtype,
  })async {
    emit(updatelaploadingstate());


    ShopLaptobModel model=ShopLaptobModel(
      name: lapname ?? " ",
      description: lapdesc ?? '',
      ram: Ram,
      price: price,
      laptobId: id,
      hardsize:hardsize,
      brand:brand,
      hardtype:hardtype,
      image:image,);
    await FirebaseFirestore.instance.collection('laptops').doc(id)
        .update(
        model.toMap()
    ).then((value) {
      emit(updatelapsuccessstate());
      Fluttertoast.showToast(msg: 'update success');
    }).catchError((error){emit(updatelaperrorstate());});
  }

  Future<void> deletelap({

    required String id,
  })async {
    emit(deletelaploadingstate());

    await FirebaseFirestore.instance.collection('laptops').doc(id)
        .delete().then((value) {
      emit(deletelapsuccessstate());
      Fluttertoast.showToast(msg: 'delete success');
    }).catchError((error){
      emit(deletelaperrorstate());
      Fluttertoast.showToast(msg: 'error delete');
    });
  }

   ShopLaptobModel? lapincart;
  Future<void> getlapbyid({required String id}) async {

    await FirebaseFirestore.instance
        .collection('laptops').doc(id)
        .get()
        .then((value) {
      lapincart=ShopLaptobModel.fromJson(value.data()!);

      emit(findlapsuccessstate());
    }).catchError((error) {
      emit(findlaperrorstate());
    });
  }

  void showMaterialDialog<T>({required BuildContext context, required Widget child})
  {
    showDialog<T>(context: context,
      builder: (BuildContext context)=>child,);
  }

//////////////////cart

  List<String> listcart =[];
  ShopCartModel ? cartModel;

  Future<void> createCart() async
  {
    User? user = await FirebaseAuth.instance.currentUser;
    ShopCartModel cartModel =ShopCartModel(
      itemscount: 0,
      totalprice: 0,
      products: listcart,
    );

    await FirebaseFirestore.instance
        .collection("cart")
        .doc(user!.uid)
        .set(cartModel.toMap())
        .then((value) {})
        .catchError((error){});
  }
 Future<void>getcartinfo()async {
   User? user = await FirebaseAuth.instance.currentUser;
   await FirebaseFirestore.instance
       .collection("cart")
       .doc(user!.uid)
       .get()
   .then((value) {
     currentcart=ShopCartModel.fromJson(value.data()!);
   }).catchError((error){
     print(error.toString());
     Fluttertoast.showToast(
       msg:"Error Occurred",
       toastLength: Toast.LENGTH_LONG,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 5,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16,

     );
   });
 }

  Future<void> addToCart({required String laptobId ,required int lapprice}) async
  {
    emit(ShopAddToCartloadState());
    await getcartinfo();
    currentcart!.products!.add(laptobId);
    User? user = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("cart")
        .doc(user!.uid)
        .update({
    "itemscount" : currentcart!.itemscount!+1,
    "totalprice" :  currentcart!.totalprice!+lapprice,
    "products" :currentcart!.products! ,
    })
        .then((value) {
      emit(ShopAddToCartSuccessState());

    })
        .catchError((error){
      emit(ShopAddToCartErrorState());
    });
  }
   List<ShopLaptobModel> itemsincart=[];
  Future<void>getcart()async {
    emit(getcartload());
    User? user = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("cart")
        .doc(user!.uid)
        .get()
        .then((value) {
      currentcart=ShopCartModel.fromJson(value.data()!);
      if(currentcart!.itemscount! >0){
        currentcart!.products!.forEach((element) async {
          await getlapbyid(id: element);
          itemsincart.add(lapincart!);

        });
      }
      emit(getcartsuccess());

    }).catchError((error){
      print(error.toString());
      Fluttertoast.showToast(
        msg:"Error Occurred",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,

      );
      emit(getcarterror());
    });

  }


}