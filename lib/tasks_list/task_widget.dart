import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/dialuge_utils.dart';
import 'package:todo_app/home/edit_task_screen.dart';
import 'package:todo_app/my_theme.dart';

import '../database/task.dart';
import '../provider/app_provider.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget(this.task);

  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditTaskScreen(task)));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Slidable(
          startActionPane: ActionPane(motion: const DrawerMotion(), children: [
            SlidableAction(
              onPressed: (contexttobedelete) {
                MyDatabase.deleteTask(task).then((value) {
                  showMessage(context, 'task deleted successfully',
                      positiveActionName: 'ok');
                }).onError((error, stackTrace) {
                  showMessage(context, 'someThing went wrong .try again');
                }).timeout(Duration(seconds: 5), onTimeout: () {
                  showMessage(context, 'Task Deleted localy ',
                      positiveActionName: 'ok');
                });
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            )
          ]),
          child: Container(
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.backgrounddark
                    : Colors.white,
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 8,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: task.isDone!
                          ? MyTheme.green
                          : (provider.isDarkMode()
                              ? MyTheme.primarydark
                              : MyTheme.primarylight)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: task.isDone!
                                    ? MyTheme.green
                                    : Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: provider.isDarkMode()
                                ? Colors.white
                                : Colors.black,
                          ),
                          Text(
                            task.descrebtion ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    MyDatabase.EditIsDone(task);
                  },
                  child: task.isDone!
                      ? Text('Done!',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: MyTheme.green))
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: provider.isDarkMode()
                                  ? MyTheme.primarydark
                                  : MyTheme.primarylight),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
