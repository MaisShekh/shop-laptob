import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/models/shop_app/shop_laptob_models.dart';

import '../../../../layout/shop_laptobs_app/cubit/cubit.dart';
import '../../../../layout/shop_laptobs_app/cubit/states.dart';
import '../../../../shared/components/components.dart';
import '../dashboardadmin.dart';

class editlap extends StatelessWidget {
  ShopLaptobModel mod;
  editlap( {required this.mod});
  var nameController =TextEditingController();
  var priceController =TextEditingController();
  var descreptionController =TextEditingController();

  var forKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    File? lapcover = cubit.lapimg;
    nameController.text=mod.name!;
    priceController.text="${mod.price!}";
    descreptionController.text=mod.description==null?" ":mod.description!;
    var brandval = mod.brand!;
    var ramval =mod.ram!;
    var hardval = mod.hardsize!;
    var hardtypeval =  mod.hardtype!;
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) async {
        if (state is updatelapsuccessstate) {
          Fluttertoast.showToast(msg: 'Lap Update success');
          navigateAndFinish(
            context,
            dashboardadmin(),
          );

          await ShopCubit.get(context).resetImage();
        }
        if (state is updatelaperrorstate) {
          Fluttertoast.showToast(msg: 'Lap Update Error',backgroundColor: Colors.red);
          navigateAndFinish(
            context,
            dashboardadmin(),
          );

          await ShopCubit.get(context).resetImage();
        }
      },

      builder: (context, state) {


        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () async {
                await cubit.resetImage();
                navigateAndFinish(context, dashboardadmin());

              },
              icon: Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            title: Text('Update Laptop ${mod.brand}'),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black,
              fontSize: 16.0,
              letterSpacing: 1.0,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.laptop_outlined,
                  ))
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: forKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16.0),
                              child: Column(
                                children: [
                                  dropdown(
                                      lable: 'Brand',
                                      context: context,
                                      dropval: brandval,
                                      items: Brands,
                                      onchange: (String? value) {
                                        brandval = value!;
                                        cubit.settype(value, brandtype);
                                      }),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  dropdown(
                                      lable: 'Ram',
                                      context: context,
                                      dropval: ramval,
                                      items: Rams,
                                      onchange: (String? value) {
                                        ramval = value!;
                                        cubit.settype(value, ramtype);
                                      }),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller:nameController ,
                                    validator: ( value)
                                    {
                                      if(value!.isEmpty)
                                      {
                                        return "Name is Short";
                                      }

                                      return null;

                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(

                                      hintText: "Name:Ex vivo",
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 16.0),
                                child: Column(
                                  children: [
                                    dropdown(lable: "Hard", context: context, dropval: hardval, items: Hards, onchange: (String? value) {
                                      hardval = value!;
                                      cubit.settype(value, hardsize);
                                    }),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    dropdown(lable: "Type", context: context, dropval: hardtypeval, items: HardsType, onchange: (String? value) {
                                      hardtypeval = value!;
                                      cubit.settype(value, hardtype);
                                    }),

                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      validator: ( value)
                                      {
                                        if(value!.isEmpty)
                                        {
                                          return "Price is Empty";
                                        }

                                        return null;

                                      },
                                      controller:priceController ,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(

                                        hintText: "Price",
                                      ),
                                    ),

                                  ],
                                ),
                              )),

                        ],
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: 100,
                        child: TextFormField(
                          controller: descreptionController,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: 15,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(

                            hintText: "Ex: Corei7 G9th",
                            label: Text('Description'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: MediaQuery.of(context).size.width*0.6,
                          decoration: BoxDecoration(
                            image: lapcover == null
                                ? DecorationImage(
                              image: NetworkImage("${mod.image}"),
                              fit: BoxFit.cover,
                            )
                                : DecorationImage(
                              image: FileImage(lapcover),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Colors.grey,
                              width: 3.0,
                              style: BorderStyle.solid,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Colors.blueGrey,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.9,

                              child: InkWell(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      color: Colors.blueAccent,
                                      size: 35.0,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Update Lap image',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  await cubit.getImage();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: 50,
                        child: ElevatedButton(onPressed: ()
                        async {
                          if(lapcover==null){
                            if(forKey.currentState!.validate()){
                              await cubit.updatelap(
                                  lapname: nameController.text,
                                  lapdesc: descreptionController.text,
                                  Ram: ramval,
                                  price: double.parse(priceController.text),
                                  hardsize: hardval,
                                  brand: brandval,
                                  hardtype: hardtypeval, id: mod.laptobId!, image: mod.image!);
                            }
                          }else{
                            if(forKey.currentState!.validate()){
                              await cubit.addlapwithimage(
                                  lapname: nameController.text,
                                  lapdesc: descreptionController.text,
                                  Ram: ramval,
                                  price: double.parse(priceController.text),
                                  hardsize: hardval,
                                  brand: brandval,
                                  hardtype: hardtypeval);
                            }
                          }



                        },
                          child: Text("Update",
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
                visible:state is updatelaploadingstate ,
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
