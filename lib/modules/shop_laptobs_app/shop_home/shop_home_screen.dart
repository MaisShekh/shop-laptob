import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';
import 'package:untitled/modules/shop_laptobs_app/shop_home/lap_information_screen.dart';
import 'package:untitled/shared/components/components.dart';

class ShopHomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return ConditionalBuilder(
            condition: ShopCubit.get(context).laptobModel.length > 0,
            builder: (context) =>  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CarouselSlider(
                      items:[
                        Container(
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
                    GridView.count(
                      crossAxisCount:2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.6,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children:List.generate(
                        ShopCubit.get(context).laptobModel.length,
                            (index) => homeBuilder(context,ShopCubit.get(context).laptobModel[index]),
                      ),

                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) =>  Center(
              child: CircularProgressIndicator(),
            ),
        );
      },
    );
  }

}

Widget homeBuilder(context , ShopLaptobModel laptobModel) => GestureDetector(
  onTap: (){
    navigateTo(context,
      LapInformationScreen(
        name: laptobModel.name!,
        price: laptobModel.price!,
        details: laptobModel.details!,
        description: laptobModel.description!,
        image: laptobModel.image!,
        laptobId: laptobModel.laptobId!,

      ),
    );
  },
  child: Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow:[
            BoxShadow(
              color: Colors.grey,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      //color: Colors.blue,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network("${laptobModel.image}",
                      fit: BoxFit.cover,
                    ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${laptobModel.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("${laptobModel.description}",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
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
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
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
                  ),

                ],
              ),
            ],
        ),
      ),
    ],
  ),
);