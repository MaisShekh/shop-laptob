import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modules/todo_app/archived_task/archived_task_screen.dart';
import 'package:untitled/modules/todo_app/done_task/done_task_screen.dart';
import 'package:untitled/modules/todo_app/new_task/new_task_screen.dart';
import 'package:untitled/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  bool isShowBottomSheet = false;
  IconData fabicon = Icons.edit;

  List<Widget> screens = [
    NewTaskScrren(),
    DoneTaskScrren(),
    ArchivedTaskScrren(),
  ];

  List<Map> tasks = [];

  void changeIndex(int index) {
    currentindex = index;
    emit(AppChangeBottomState());
  }

  void changeBottomSheet({
    required bool isShow,
    required IconData icon,
  }) {
    isShowBottomSheet = isShow;
    fabicon = icon;
    emit(AppChangeBottomSheetState());
  }

  late Database database;

  void createDatabase() {
    openDatabase(
      "todo.db",
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, tasks TEXT ,date TEXT)'
        ).then((value) {
          print('table created');
        });
      },

      onOpen: (database) {
        print("database on opened");
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  void insertDatabase({
    required String tasks,
    required String date,
  }) {
    database.transaction((txn) async
    {
      txn.rawInsert('INSERT INTO tasks (tasks,date) VALUES ("$tasks","$date")');
    }).then((value) {
      emit(AppInsertDataBaseState());
      print("$value insert table ok");
    });
  }

}