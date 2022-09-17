import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_provider.dart';
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
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedIndex == 0
                ? AppLocalizations.of(context)!.todoList
                : AppLocalizations.of(context)!.settings,
            style: TextStyle(
                color:
                    provider.isDarkMode() ? MyTheme.primarydark : Colors.white),
          ),
          backgroundColor: provider.isDarkMode()
              ? MyTheme.primarydark
              : MyTheme.primarylight,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 12,
          onPressed: () {
            openBottomSheet(context);
          },
          child: Icon(Icons.add),
          backgroundColor: provider.isDarkMode()
              ? MyTheme.primarydark
              : MyTheme.primarylight,
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          borderColor: Color(0xFFC8C9CB),
          height: 75,
          iconSize: 35,
          icons: iconlist,
          borderWidth: 3,
          activeIndex: selectedIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10,
          rightCornerRadius: 10,
          onTap: (index) => setState(() => selectedIndex = index),
          inactiveColor: Color(0xFFC8C9CB),
          activeColor: provider.isDarkMode()
              ? MyTheme.primarydark
              : MyTheme.primarylight,
          backgroundColor: provider.isDarkMode()
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.white,
        ),
        body: tabs[selectedIndex]
        //  ),
        );
  }

  List<IconData> iconlist = [Icons.list, Icons.settings];
  List<Widget> tabs = [TaskTab(), SettingsTab()];

  void openBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (buildcontext) {
          return AddTaskBottomSheet();
        },
        isScrollControlled: true);
  }
}
