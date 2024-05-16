import 'package:flutter/material.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';

class LapInformationScreen extends StatelessWidget {


     String   name;
     int   price;
     String   details;
     String  description;
     String   image;
     String   laptobId;


    LapInformationScreen({
      required this.name,
      required this.price,
      required this.details,
      required this.description,
      required this.image,
      required this.laptobId,

    });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laptob Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network("${image}",
                //fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("${name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${description}",
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${details}",
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: (){
                ShopCubit.get(context).addToCart(laptobId: laptobId);

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
    );
  }
}
