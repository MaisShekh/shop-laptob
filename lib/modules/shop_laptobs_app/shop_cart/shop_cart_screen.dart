import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';

class ShopCartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListView.separated(
                itemBuilder: (context, index) => buildItemCart(ShopCubit.get(context).laptobModel[index],index),
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemCount: ShopCubit.get(context).laptobModel.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
            SizedBox(
              height: 100,
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
                Text("5000000",
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


