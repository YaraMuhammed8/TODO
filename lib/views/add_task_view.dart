import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/database_cubit/database_cubit.dart';
import 'package:todo/components/build_button.dart';
import 'package:todo/components/build_textformfield.dart';
import 'package:intl/intl.dart';

import '../Models/task.dart';

class AddTaskView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBaseCubit, DataBaseState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = DataBaseCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                "Add your task",
                style: TextStyle(fontSize: 25, fontFamily: "Cairo",
                    fontWeight: FontWeight.w500,color: Colors.grey.shade700),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BuildTextFormField(
                    controller: nameController,
                    labelText: "Name",
                    hintText: "Enter name of the task",
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.drive_file_rename_outline,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: BuildTextFormField(
                          controller: dateController,
                          labelText: "Date",
                          hintText: "Enter date of the task",
                          keyboardType: TextInputType.datetime,
                          prefixIcon: Icons.calendar_today_sharp,
                          onTap: () {
                            print("tapped");
                            showDatePicker(context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 30)
                            ).then((value) {
                              dateController.text = DateFormat.MMMMd().format(value!);
                              print(dateController.text);
                            });
                          },
                        ),),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BuildTextFormField(
                          controller: timeController,
                          labelText: "Time",
                          hintText: "Enter time of the task",
                          keyboardType: TextInputType.datetime,
                          prefixIcon: Icons.watch_later_outlined,
                          onTap: () {
                            showTimePicker(context: context, initialTime: TimeOfDay.now())
                                .then((value) {
                              timeController.text = value!.format(context);
                              print(timeController.text);
                            });
                          },
                        ),),
                    ],
                  ),
                  const SizedBox(height: 20),
                  BuildButton(text: "Add task", onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      Task task = Task(name:nameController.text,time: timeController.text,date: dateController.text);
                      cubit.addTaskToDB(task);
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}