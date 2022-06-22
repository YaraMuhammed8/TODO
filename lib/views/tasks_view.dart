import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/bloc/database_cubit/database_cubit.dart';

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBaseCubit, DataBaseState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DataBaseCubit.get(context);
        return Center(
            child: (state is InitDBLoading || state is MapDataFromDBLoading)
                ? const CircularProgressIndicator()
                : (cubit.tasks == null)
                    ? const Text(
                        "Sorry, an error has occurred",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontFamily: "Cairo"),
                      )
                    : (cubit.tasks!.isEmpty)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "No tasks",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontFamily: "Cairo"),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Add new task ",
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 20,
                                          fontFamily: "Cairo")),
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: SvgPicture.asset(
                                          "assets/images/arrow.svg",
                                          color: const Color(0xffFFB8B7)))
                                ],
                              )
                            ],
                          )
                        : ListView.separated(
                            itemCount: cubit.tasks!.length,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) => Card(
                                  elevation: 0,
                                  //color: (index%2 ==1)?Color(0xffFFF7F5):Colors.white,
                                  child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/check2.png",
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(cubit.tasks![index]["title"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            fontFamily: "Tajawal")),
                                    subtitle: Text(cubit.tasks![index]["date"]),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${cubit.tasks![index]["time"]}  ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Transform.translate(
                                            offset: const Offset(5, -15),
                                            child: IconButton(
                                                onPressed: () {
                                                  cubit.deleteTaskFromDB(index+1);
                                                },
                                                icon: Icon(Icons.delete_rounded,
                                                    color:
                                                        Colors.grey.shade500))),
                                      ],
                                    ),
                                  ),
                                )));
      },
    );
  }
}
