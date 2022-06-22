part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}
class MainGenderChanged extends MainState {}
class MainSliderCurrentPageChanged extends MainState {}
class MainHomeScreenCurrentViewChanged extends MainState {}