import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/tasks_list/task_widget.dart';

import '../provider/app_provider.dart';

class TaskTab extends StatefulWidget {
  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  var selectedDate = DateTime.now();
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            showYears: true,
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              if (date == null) return;

              setState(() {
                selectedDate = date;
              });
            },
            leftMargin: 30,
            monthColor: provider.isDarkMode() ? Colors.white : Colors.black,
            dayColor: provider.isDarkMode() ? Colors.white : Colors.black,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Theme.of(context).primaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Task>>(
              stream: MyDatabase.listenForTasksRealTimeUpdates(selectedDate),
              builder: (buildcontext, snapshot) {
                if (snapshot.hasError) {
                  return Text('error ,try later');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Text('loading..');
                }

                var data = snapshot.data?.docs
                    .map((elemnt) => elemnt.data())
                    .toList(); // we get tasks from snapshot in getAllTasks func
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return TaskWidget(data![index]);
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
