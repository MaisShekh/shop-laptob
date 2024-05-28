import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';


class HomeLayout extends StatelessWidget {

var scaffoldKey =GlobalKey<ScaffoldState>();
TextEditingController tasksController =TextEditingController();
TextEditingController dateController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
        if (state is AppInsertDataBaseState){
          Navigator.pop(context);
        }
      },
        builder:(context, state)
        {
          AppCubit cubit=AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('ToDo App',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()
          {
            if (cubit.isShowBottomSheet)
            {
              Navigator.pop(context);
              cubit.isShowBottomSheet = false;
              cubit.insertDatabase( tasks: tasksController.text,
                  date: dateController.text);
            }
            else{
              scaffoldKey.currentState!.showBottomSheet((context) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: tasksController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Tasks',
                          prefix: Icon(Icons.task),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: dateController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Date',
                          prefix: Icon(Icons.calendar_month_outlined),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).closed.then((value)  {
                cubit.changeBottomSheet(isShow: false,
                    icon: Icons.edit);
              });

              cubit.changeBottomSheet(isShow: true,
                  icon: Icons.add);

               }
            },
            tooltip: "insert tasks" ,
            backgroundColor: Colors.blue,
            child: Icon(cubit.fabicon,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.changeIndex(value);
            },
            currentIndex: cubit.currentindex,
            selectedItemColor: Colors.blue,
            items: [
              BottomNavigationBarItem(
                icon:Icon( Icons.task),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon:Icon( Icons.done),
                label: 'Done',
              ),
              BottomNavigationBarItem(
                icon:Icon( Icons.archive),
                label: 'Archived',
              ),
            ],
          ),
          body: cubit.screens[cubit.currentindex],
        );
        },
      ),
    );
  }
}
