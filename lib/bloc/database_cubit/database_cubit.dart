import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/services/sqlite/sqlite_helper.dart';

import '../../Models/task.dart';
part 'database_state.dart';

class DataBaseCubit extends Cubit<DataBaseState> {
  DataBaseCubit() : super(DataBaseInitial());
  static DataBaseCubit get(context) => BlocProvider.of(context);

  List<Map>? tasks;
  void initDB() {
    emit(InitDBLoading());
    SQLiteHelper.createDB().then((value) {
      emit(InitDBSuccessful());
      mapDataFromDB();
    }).catchError((error) {
      emit(InitDBError());
      print("init db error is $error");
    });
  }

  void mapDataFromDB() {
    emit(MapDataFromDBLoading());
    SQLiteHelper.getDataFromDB().then((value) {
      tasks = value;
      emit(MapDataFromDBSuccessful());
      print(tasks);
    }).catchError((error) {
      emit(MapDataFromDBError());
      print("mapping data from db error is $error");
    });
  }

  void addTaskToDB(Task task) {
    emit(AddTaskToDBLoading());
    SQLiteHelper.insertRaw(task).then((value) {
      emit(AddTaskToDBSuccessful());
      mapDataFromDB();
    }).catchError((error) {
      emit(AddTaskToDBError());
      print("add task into db error is $error");
    });
  }

  void deleteTaskFromDB(int taskID) {
    emit(DeleteTaskFromDBLoading());
    SQLiteHelper.deleteRaw(taskID).then((value) {
      emit(DeleteTaskFromDBSuccessful());
      mapDataFromDB();
    }).catchError((error) {
      emit(DeleteTaskFromDBError());
      print("delete task from db error is $error");
    });
  }
}
