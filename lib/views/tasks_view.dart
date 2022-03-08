import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/Models/task_model.dart';

class TasksView extends StatefulWidget {
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: (tasks.isEmpty) ?
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "No tasks",style: TextStyle(color: Colors.grey, fontSize: 20, fontFamily: "Cairo"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add new task ", style: TextStyle(color: Colors.grey.shade700,
                    fontSize: 20, fontFamily: "Cairo")),
                SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset("assets/images/arrow.svg",color: const Color(0xffFFB8B7)))
              ],
            )
          ],
        )
            : ListView.separated(
            itemCount: tasks.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => Card(
              elevation: 0,
              //color: (index%2 ==1)?Color(0xffFFF7F5):Colors.white,
              child: ListTile(
                leading: Image.asset("assets/images/check2.png", height: 30, width: 30, fit: BoxFit.cover,),
                title: Text(tasks[index].name,style: const TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 20,fontFamily: "Tajawal")),
                subtitle: Text(tasks[index].date),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${tasks[index].time}  ",style: const TextStyle(fontWeight: FontWeight.bold),),
                    Transform.translate(offset: const Offset(5, -15),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                tasks.removeAt(index);
                              });
                              },
                            icon: Icon(Icons.delete_rounded, color: Colors.grey.shade500)
                        )
                    ),
                  ],
                ),
              ),
            )));
  }
}
