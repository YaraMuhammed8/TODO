import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/main_cubit/main_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
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
                child: Image.asset("assets/images/background.png",
                    fit: BoxFit.cover)),
          ),
          body: cubit.views[cubit.homeScreenCurrentViewIndex],
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
              currentIndex: cubit.homeScreenCurrentViewIndex,
              onTap: (index) {
                cubit.changeHomeScreenCurrentView(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.format_list_bulleted), label: "Tasks"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), label: "Add task"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.logout), label: "Logout"),
              ],
            ),
          ),
        );
      },
    );
  }
}
