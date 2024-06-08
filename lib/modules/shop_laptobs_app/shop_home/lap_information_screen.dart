import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';

class LapInformationScreen extends StatelessWidget {

  ShopLaptobModel mod;

    LapInformationScreen({
      required this.mod,

    });



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: ( context, state) {
        if(state is ShopAddToCartSuccessState){
          Fluttertoast.showToast(
            msg:"Add Success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16,

          );
        }else if(state is ShopAddToCartErrorState){
          Fluttertoast.showToast(
            msg:"Error ADD",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,

          );
        }
      },
      builder: ( context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Laptob Details"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: Offset(
                                2,
                                4,
                              ),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage("${mod.image}",
                              //fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Brand: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(" ${mod.brand}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Name: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(" ${mod.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Price: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(" ${mod.price}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text("Details:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Expanded(child: Text("Ram :${mod.ram} ",style: TextStyle(
                          color: Colors.grey[400], fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),),),
                        Expanded(child: Text("Hard :${mod.hardsize} ,",style: TextStyle(
                          color: Colors.grey[400], fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),)),
                        Expanded(child: Text("Type :${mod.hardtype} ",style: TextStyle(
                          color: Colors.grey[400], fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),)),
                      ],),


                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Laptop Description :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                        ],
                      ),
                      mod.description==""?SizedBox() :SizedBox(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Text(mod.description!,
                          style: TextStyle(
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[400],

                          ),
                          //overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                          ShopCubit.get(context).addToCart(laptobId: mod.laptobId!,lapprice: mod.price!);

                        },
                          child: Text("Add To Cart",
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
                visible:state is ShopAddToCartloadState ,
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
      },

    );
  }
}
