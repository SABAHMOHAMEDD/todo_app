import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/settings/settings_tab.dart';
import 'package:todo_app/tasks_list/tasks_list_tab.dart';

import 'add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = 'test';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String imageUrl =
      'https://i.ibb.co/ygbbHzM/b5b718c4b2bca136620e60cd7880c238.jpg';
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedIndex == 0 ? 'To Do List' : 'Settings',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openBottomSheet(context);
          },
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,

          // for dark mode
          // focusColor: Colors.brown,
          // foregroundColor: Colors.white,
          // backgroundColor: Colors.brown,
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          height: 75,
          iconSize: 35,
          icons: iconlist,
          activeIndex: selectedIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10,
          rightCornerRadius: 10,
          onTap: (index) => setState(() => selectedIndex = index),
          activeColor:
              Theme.of(context).primaryColor, // Colors.white for dark mode

          //  backgroundColor: Theme.of(context).primaryColor,
          //   backgroundColor: Colors.brown,  for dark mode
        ),
        body:

            //  Container(
            //    decoration: BoxDecoration(
            //      image: DecorationImage(
            //        fit: BoxFit.fill,
            //       image: NetworkImage(imageUrl),
            //    ),
            // ),
            // //
            // //
            //    child:
            tabs[selectedIndex]
        //  ),
        );
  }

  List<IconData> iconlist = [Icons.list, Icons.settings];
  List<Widget> tabs = [TaskTab(), SettingsTab()];

  void openBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (buildercontext) {
          return AddTaskBottomSheet();
        },
        isScrollControlled: true);
  }
}
