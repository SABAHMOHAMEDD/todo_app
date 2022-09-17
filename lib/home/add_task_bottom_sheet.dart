import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/date_utils.dart';
import 'package:todo_app/dialuge_utils.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descreptionController = TextEditingController();
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      color: provider.isDarkMode() ? MyTheme.backgrounddark : Colors.white,
      height: MediaQuery.of(context).size.height * .7,
      padding: EdgeInsets.all(15),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: provider.isDarkMode()
                        ? Colors.white
                        : MyTheme.primarylight,
                  ),
              textAlign: TextAlign.center,
            ),
            // SizedBox(
            //   height: 15,
            // ),
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Please Enter Title';
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text('Title',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: provider.isDarkMode()
                            ? Colors.white
                            : MyTheme.primarylight,
                        fontSize: 20)),
              ),
            ),

            // SizedBox(
            //   height: 7,
            // ),
            TextFormField(
              controller: descreptionController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Please Enter Descrebtion';
                }
                return null;
              },
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                label: Text('Descrebtion',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: provider.isDarkMode()
                            ? Colors.white
                            : MyTheme.primarylight,
                        fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Select Date',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: provider.isDarkMode()
                      ? Colors.white
                      : MyTheme.primarylight),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(right: 250),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor)),
              child: InkWell(
                onTap: () {
                  showDateDialog(context);
                },
                child: Text(
                    ' ${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Color(0xFFA9A9A9))),
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  addTask();
                },
                child: const Text('Add'),
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  void showDateDialog(context) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void addTask() {
    var provider = Provider.of<AppProvider>(context, listen: false);

    if (formkey.currentState?.validate() == true) {
      String title = titleController.text;
      String desc = descreptionController.text;

      Task task = Task(
          // we create object from data class with data from our page here
          title: title, // to pass it to insert func
          descrebtion: desc,
          dateTime: dateOnly(selectedDate),
          isDone: false);
      showLoading(context, 'Loading....', isCancelabele: false);
      MyDatabase.insertTask(task).then((value) {
        provider.retrieveTasks();

        hideLoading(context);
        showMessage(context, 'Task Added Successfully',
            positiveActionName: 'ok', posAction: () {
          Navigator.pop(context);
        });
      }).onError((error, stackTrace) {
        hideLoading(context);
        showMessage(context, 'Faild Adding Task', negativeActionName: 'ok',
            negAction: () {
          Navigator.pop(context);
        });
      }).timeout(const Duration(seconds: 5), onTimeout: () {
        hideLoading(context);
        provider.retrieveTasks();
        showMessage(context, 'timeout,task added in cache');
      });
    }
  }
}
