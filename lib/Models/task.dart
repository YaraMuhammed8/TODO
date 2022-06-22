class Task{
  String name;
  String date;
  String time;
  String status;
  Task({required this.name,required this.time,required this.date,this.status = "new"});
}