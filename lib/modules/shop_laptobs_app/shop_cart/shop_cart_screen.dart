
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';

import '../../../shared/components/components.dart';

class ShopCartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..getcart(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return currentcart !=null ? Scaffold(
            body: ConditionalBuilder(
              condition:state is! getcartload ,

              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ListView.separated(
                          itemBuilder: (context, index) => buildItemCart2(ShopCubit.get(context).itemsincart[index],index,context),
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                          itemCount: ShopCubit.get(context).itemsincart.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: [
                            Text("Items Count",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Text("${currentcart!.itemscount}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("Total Price",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Text("${currentcart!.totalprice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(onPressed: ()
                          {},
                            child: Text("Check Out",
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
              fallback: (BuildContext context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ListView.separated(
                          itemBuilder: (context, index) => buildItemCartload(context),
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                          itemCount: 2,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: [
                            Text("Items Count",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Shimmer(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey[300]!,
                                  Colors.grey[100]!,
                                  Colors.grey[300]!
                                ],
                                stops: [0.4, 0.5, 0.6],
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.01,
                                color: Colors.white,
                                child: Text(
                                  "                          ",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("Total Price",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Shimmer(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey[300]!,
                                  Colors.grey[100]!,
                                  Colors.grey[300]!
                                ],
                                stops: [0.4, 0.5, 0.6],
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.01,
                                color: Colors.white,
                                child: Text(
                                  "                          ",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(onPressed: ()
                          {},
                            child: Text("Check Out",
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

            ),
          )
          :Scaffold(
            body:Container(
              child: Center(
                child:Text("Something Error")
              ),
            )
          );
        },

      ),
    );
  }
}

Widget buildItemCart(ShopLaptobModel laptobModel ,index) =>Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20.0),
    color: Colors.grey[100],
  ),
  child: Row(
    children: [
      Expanded(
        child: Container(
          // height: 100,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network("${laptobModel.image}",
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${laptobModel.name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${laptobModel.description}",
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${laptobModel.price}",
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Spacer(),
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[400],
                ),
                width: 25,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                )
            ),
            SizedBox(
              width: 5,
            ),
            Text("1"),
            SizedBox(
              width: 5,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black,
                ),
                width: 25,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                )
            ),
          ],
        ),
      ),



    ],
  ),
);
Widget buildItemCart2(ShopLaptobModel model ,index,context) =>    Container(
  padding: EdgeInsets.all(10),
  height: MediaQuery.of(context).size.height * 0.1719,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        spreadRadius: 4,
        blurRadius: 5,
        offset: Offset(
          2,
          4,
        ),
      ),
    ],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          image: NetworkImage(
            "${model.image}",
          ),
          width:MediaQuery.of(context).size.width * 0.3,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Brand : ${model.brand}", style:TextStyle(fontSize: 14,)),
              SizedBox(
                height: 10,
              ),
              Text( "Name: ${model.name}", style:TextStyle(fontSize: 14,color: Colors.grey)),
              SizedBox(
                height: MediaQuery.of(context).size.height  * 0.02,
              ),
              Text( "Price: ${model.price}", style:TextStyle(fontSize: 14,)),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon:Icon(Icons.delete_outline,
                size: 28,
                color: Colors.redAccent,),
              onPressed: (){},
            )
          ],
        ),
      )

    ],
  ),
);

Widget buildItemCartload(context) =>    Container(
  padding: EdgeInsets.all(10),
  height: MediaQuery.of(context).size.height * 0.1719,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        spreadRadius: 4,
        blurRadius: 5,
        offset: Offset(
          2,
          4,
        ),
      ),
    ],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Shimmer(
          gradient: LinearGradient(
            colors: [
              Colors.grey[300]!,
              Colors.grey[100]!,
              Colors.grey[300]!
            ],
            stops: [0.4, 0.5, 0.6],),
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[300]!,
                    Colors.grey[100]!,
                    Colors.grey[300]!
                  ],
                  stops: [0.4, 0.5, 0.6],
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  color: Colors.white,
                  child: Text(
                    "                ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Shimmer(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[300]!,
                    Colors.grey[100]!,
                    Colors.grey[300]!
                  ],
                  stops: [0.4, 0.5, 0.6],
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  color: Colors.white,
                  child: Text(
                    "                          ",
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height  * 0.02,
              ),
              Shimmer(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[300]!,
                    Colors.grey[100]!,
                    Colors.grey[300]!
                  ],
                  stops: [0.4, 0.5, 0.6],
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  color: Colors.white,
                  child: Text(
                    "                          ",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon:Icon(Icons.delete_outline,
                size: 28,
                color: Colors.redAccent,),
              onPressed: (){},
            )
          ],
        ),
      )

    ],
  ),
);
