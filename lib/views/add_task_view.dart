import 'package:flutter/material.dart';
import 'package:todo/Models/task_model.dart';
import 'package:todo/components/build_textformfield.dart';
import 'package:intl/intl.dart';

class AddTaskView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    controller: name,
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
                          controller: date,
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
                              date.text = DateFormat.MMMMd().format(value!);
                              print(date.text);
                            });
                          },
                        ),),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BuildTextFormField(
                          controller: time,
                          labelText: "Time",
                          hintText: "Enter time of the task",
                          keyboardType: TextInputType.datetime,
                          prefixIcon: Icons.watch_later_outlined,
                          onTap: () {
                            showTimePicker(context: context, initialTime: TimeOfDay.now())
                                .then((value) {
                              time.text = value!.format(context);
                              print(time.text);
                            });
                          },
                        ),),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffFFD4B8),
                            Color(0xffFFA090),
                          ],
                        )),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          tasks.add(Task(name: name.text,date: date.text,time: time.text));
                        }
                      },
                      height: 55,minWidth: double.infinity,
                      textColor: Colors.white,
                      child: const Text(
                        "Add task",
                        style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
