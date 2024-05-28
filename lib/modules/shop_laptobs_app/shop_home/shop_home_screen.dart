import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_home/lap_information_screen.dart';
import 'package:untitled/shared/components/components.dart';

class ShopHomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext contex) => ShopCubit()..getlaps(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return Scaffold(
            body: ConditionalBuilder(
                condition:state is! findlaploadstate,
                builder: (context) =>  SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CarouselSlider(
                          items:[
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child:    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        image: AssetImage('images/lap1.jpg'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                            ] ,
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            reverse: false,
                            viewportFraction: 1.0,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(seconds: 2),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,

                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ShopCubit.get(context).laps.length==0? Container(
                            height: MediaQuery.of(context).size.height*0.3,
                            child: Center(child: Text('NO Laptops')))
                        :GridView.count(
                          crossAxisCount:2,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children:List.generate(
                            ShopCubit.get(context).laps.length,
                                (index) => homeBuilder(context,ShopCubit.get(context).laps[index]),
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
                fallback: (context) =>  loadhome(context),
            ),
          );
        },
      ),
    );
  }

}

Widget homeBuilder(context , ShopLaptobModel laptobModel) => Padding(
  padding: const EdgeInsets.all(6.0),
  child:Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          spreadRadius: 3,
          blurRadius: 4,
          offset: Offset(
            2,
            4,
          ),
        ),
      ],
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(
                "${laptobModel.image}",
              ),
              width:MediaQuery.of(context).size.width * 0.9,
              height:MediaQuery.of(context).size.height * 0.15 ,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${laptobModel.brand}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("${laptobModel.name}",
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Row(
                  children: [
                    Text("${laptobModel.price}",
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: (){
                        navigateTo(context,
                          LapInformationScreen(
                            mod:laptobModel ,

                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios
                      ),
                    ),
                  )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget loadhome(BuildContext context)=>SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:    Shimmer(
            gradient: SweepGradient(
              colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
              stops: [0.4, 0.5, 0.6],
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width*.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 8,
                    blurRadius: 5,
                    offset: Offset(
                      4,
                      4,
                    ),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,

            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
       GridView.count(
          crossAxisCount:2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children:List.generate(
            4,
                (index) => productload(context,),
          ),

        ),
      ],
    ),
  ),
);

Widget productload(context ,) => Padding(
  padding: const EdgeInsets.all(6.0),
  child:Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          spreadRadius: 3,
          blurRadius: 4,
          offset: Offset(
            2,
            4,
          ),
        ),
      ],
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Shimmer(
              gradient: LinearGradient(
                colors: [
                  Colors.grey[300]!,
                  Colors.grey[100]!,
                  Colors.grey[300]!
                ],
                stops: [0.4, 0.5, 0.6],),

            child:Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Align(
            alignment: Alignment.topLeft,
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
                  height: MediaQuery.of(context).size.height * 0.005,
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
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Row(
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
                          "           ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: (){},
                        child: Icon(
                            Icons.arrow_forward_ios
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);


