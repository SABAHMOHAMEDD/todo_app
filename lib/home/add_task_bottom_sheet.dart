import 'package:flutter/material.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descreptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    color: Theme.of(context).primaryColor,
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
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 20)),
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
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Select Date',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(right: 250),
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
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            SizedBox(
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
                child: Text('Add'),
              ),
            ),
            SizedBox(
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
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (date != null) {
      setState(() {
        selectedDate = date!;
      });
    }
  }

  void addTask() {
    if (formkey.currentState?.validate() == true) {
      String title = titleController.text;
      String desc = descreptionController.text;

      Task task = Task(
          // we create object from data class with data from our page here
          title: title, // to pass it to insert func
          descrebtion: desc,
          dateTime: selectedDate,
          isDone: false);
      MyDatabase.insertTask(task);
    }
  }
}
