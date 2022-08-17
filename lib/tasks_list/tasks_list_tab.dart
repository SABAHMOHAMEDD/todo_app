import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/tasks_list/task_widget.dart';

class TaskTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            showYears: true,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.black,

            activeDayColor: Theme.of(context).primaryColor,
            // Colors.brown  for dark mode
            activeBackgroundDayColor: Colors.white,
            dotsColor: Colors.lightBlueAccent,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return TaskWidget();
              },
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
