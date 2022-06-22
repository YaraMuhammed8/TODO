part of 'database_cubit.dart';

@immutable
abstract class DataBaseState {}

class DataBaseInitial extends DataBaseState {}
class InitDBLoading extends DataBaseState {}
class InitDBSuccessful extends DataBaseState {}
class InitDBError extends DataBaseState {}
class MapDataFromDBLoading extends DataBaseState {}
class MapDataFromDBSuccessful extends DataBaseState {}
class MapDataFromDBError extends DataBaseState {}
class AddTaskToDBLoading extends DataBaseState {}
class AddTaskToDBSuccessful extends DataBaseState {}
class AddTaskToDBError extends DataBaseState {}
class DeleteTaskFromDBLoading extends DataBaseState {}
class DeleteTaskFromDBSuccessful extends DataBaseState {}
class DeleteTaskFromDBError extends DataBaseState {}