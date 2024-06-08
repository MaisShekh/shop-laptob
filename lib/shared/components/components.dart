import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/shop_app/shop_cart_models.dart';
import '../../models/shop_app/shop_laptob_models.dart';
import '../../models/shop_app/shop_users_models.dart';
ShopUserModel? userModel ;
List<ShopLaptobModel> laptobModel =[];
var brandtype = Brands.first;
var ramtype = Rams.first;
var hardsize = Hards.first;
var hardtype = HardsType.first;
const List<String> Brands = <String>['Apple', 'Asus','Acer','Dell','Lenovo','HP','Samsung','LG'];
const List<String> Rams = <String>['2 GB', '4 GB','6 GB','8 GB','12 GB','16 GB','24 GB','32 GB'];
const List<String> Hards = <String>['128 GB', '256 GB','512 GB','1 TB','2 TB'];
const List<String> HardsType = <String>['HDD', 'SSD'];
ShopCartModel? currentcart;

Widget buildTasksItem(Map tasks) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
          Text("${tasks["tasks"]}"),
          SizedBox(
            width: 15,
          ),
      Text("${tasks["date"]}",
        style: TextStyle(
          color: Colors.grey[500],
        ),
      ),
    ],
  ),
);

void navigateTo(context,widget) => Navigator.push
  (
    context,
    MaterialPageRoute(
        builder:(context) => widget,
    ),
);

void navigateAndFinish(context,widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder:(context) => widget,
    ),
        (route) => false,
);

Widget dropdown({required String lable,
  required BuildContext context,
  required String dropval,
  required List<String> items,
  required void Function(String? value) onchange})=>Row(
  children: [
    Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0),
          child: Text(lable)),
    ),
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.05,
    ),
    Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      child: DropdownButtonFormField<String>(
        decoration:
        InputDecoration(border: InputBorder.none),
        borderRadius: BorderRadius.circular(10.0),
        padding: EdgeInsets.only(
          left: 10.0,
        ),
        value: dropval,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: TextStyle(color: Colors.black),
        onChanged:onchange,
        items: items.map<DropdownMenuItem<String>>(
                (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
      ),
    ),
  ],
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



