import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/shop_laptobs_app/cubit/cubit.dart';
import '../../../../layout/shop_laptobs_app/cubit/states.dart';
import '../../../../models/shop_app/shop_laptob_models.dart';
import '../../../../shared/components/components.dart';
import '../dashboardadmin.dart';
import 'editlap.dart';
enum ButtonAction {
  cancel,
  Agree,
}
class alllap extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext contex) => ShopCubit()..getlaps(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () async {

                  navigateAndFinish(context, dashboardadmin());

                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
              title: Text('Edit Laptop'),
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
                      Icons.edit,
                    ))
              ],
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: ConditionalBuilder(
                condition: state is! findlaploadstate,
                builder: (context) => SingleChildScrollView(
                  child: ShopCubit.get(context).laps.length==0? Container(
                      height: MediaQuery.of(context).size.height*0.9,
                      child: Center(child: Text('NO Laptops in this section')))
                      :Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height*0.9,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => newbuild(ShopCubit
                          .get(context)
                          .laps[
                      index],context),
                      itemCount: ShopCubit.get(context).laps.length,
                    ),
                  ),
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        },
      ),
    );
  }

 Widget newbuild(ShopLaptobModel model,BuildContext context) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(15),
            topLeft: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.outer,
            blurRadius: 10.0,
            color: Colors.grey,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Card(
          clipBehavior: Clip.antiAlias,
          child: ExpandableNotifier(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(10)),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage('${model.image}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  ExpandablePanel(
                    header: Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 10),
                        child: Text('Lap Brand: ${model.brand}')),
                    collapsed: Text(
                      'Lap Description: ${model.description}',
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded:Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 175.0,
                                child: Text(
                                  'Lap Description: ${model.description}',
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'Lap Name: ${model.name}',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  navigateTo(
                                    context,
                                    editlap(mod: model,),
                                  );
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.mode_edit_outline_outlined,
                                      color: Colors.blue,
                                      size: 25.0,
                                    ))),
                            SizedBox(
                              height: 150,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () async {
                                    ShopCubit
                                        .get(context)
                                        .showMaterialDialog<ButtonAction>(
                                      context: context,
                                      child: AlertDialog(
                                        title: const Text(
                                            'Are you sure you want to delete the item?'),
                                        content: Text(
                                          'If you want to delete the item, choose AGREE or cancel the operation',
                                        ),
                                        actions: <Widget>[
                                          InkWell(
                                            child: const Text('Cancel'),
                                            onTap: () {
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                            },
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          InkWell(
                                            child: const Text('Agree'),
                                            onTap: () async {
                                              await ShopCubit
                                                  .get(context)
                                                  .deletelap(
                                                  id: '${model.laptobId}');
                                              Navigator.pop(
                                                  context, ButtonAction.Agree);
                                              navigateAndFinish(context, dashboardadmin());
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.blue,
                                    size: 25.0,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),

                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    ),
  );
  }

