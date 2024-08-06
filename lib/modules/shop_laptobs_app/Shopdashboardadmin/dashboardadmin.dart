import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_laptobs_app/cubit/states.dart';

import '../../../shared/components/components.dart';
import '../shop_login/shop_login_screen.dart';
import 'laptops.dart';

class dashboardadmin extends StatelessWidget {
  const dashboardadmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
        builder: (context, state){
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Dashboard"),
              actions: [

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.laptop_outlined,
                  ),
                ),
              ],
            ),
            body:Laptops(),
          );
        }
    );
  }
}
