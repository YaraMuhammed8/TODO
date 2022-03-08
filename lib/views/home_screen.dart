import 'package:flutter/material.dart';
import 'package:todo/views/add_task_view.dart';
import 'package:todo/views/logout_alert.dart';
import 'package:todo/views/tasks_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> views = [TasksView(), AddTaskView(), LogoutAlert()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 150,
        elevation: 0,
        flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80),
            ),
            child: Image.asset("assets/images/background.png", fit: BoxFit.cover)
        ),
      ),
      body: views[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff272F40),
          selectedItemColor: const Color(0xffFFA090),
          iconSize: 28,
          selectedLabelStyle: const TextStyle(fontFamily: "Cairo"),
          unselectedLabelStyle: const TextStyle(fontFamily: "Cairo"),
          unselectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: "Tasks"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add task"),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
          ],
        ),
      ),
    );
  }
}
