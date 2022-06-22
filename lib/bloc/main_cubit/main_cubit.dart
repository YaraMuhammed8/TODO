import 'package:flutter_bloc/flutter_bloc.dart';
import '../../views/add_task_view.dart';
import '../../views/logout_alert.dart';
import '../../views/tasks_view.dart';
import 'package:flutter/material.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  String selectedGender = "male";
  changeGender(String value) {
    selectedGender = value;
    emit(MainGenderChanged());
  }

  List<String> sliderTexts = [
    "Organize your tasks",
    "Manage your time",
    "Be more productive and efficient",
  ];
  int sliderCurrentPageIndex = 0;
  changeSliderCurrentPage(int index) {
    sliderCurrentPageIndex = index;
    emit(MainSliderCurrentPageChanged());
  }

  int homeScreenCurrentViewIndex = 0;
  List<Widget> views = [const TasksView(), AddTaskView(), const LogoutAlert()];
  changeHomeScreenCurrentView(int index) {
    homeScreenCurrentViewIndex = index;
    emit(MainHomeScreenCurrentViewChanged());
  }
}
