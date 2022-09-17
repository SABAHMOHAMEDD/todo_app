import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/my_theme.dart';

import '../date_utils.dart';
import '../provider/app_provider.dart';

class EditTaskScreen extends StatefulWidget {
  static const String RouteName = 'edit';
  Task task;

  EditTaskScreen(this.task);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState(task);
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late AppProvider provider;
  late DateTime selectedDate;
  late Task task;

  _EditTaskScreenState(this.task);

  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descreptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    selectedDate = widget.task.dateTime!;
    provider = Provider.of(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.infinity,
              height: size.height * 0.2,
              color: MyTheme.primarylight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: provider.isDarkMode()
                            ? MyTheme.backgrounddark
                            : Colors.white,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.todoList,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ]),
            ),
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 30, right: 30),
              height: size.height * 0.8,
              //color: Colors.green,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: provider.isDarkMode()
                    ? MyTheme.backgrounddark
                    : Colors.white,
              ),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Edit Task',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: provider.isDarkMode()
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: titleController,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          //initialValue: task.title ,
                          textInputAction: TextInputAction.next,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter Title';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              label: Text('edit title',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontSize: 20))),
                        ),
                        SizedBox(
                          height: 40,
                        ),
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
                          // initialValue: task.descrebtion,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.black),
                          decoration: InputDecoration(
                              label: Text('Edit desc',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontSize: 20))),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Select Date',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: provider.isDarkMode()
                                      ? Colors.white
                                      : Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          //  margin:  EdgeInsets.only(right:180),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).primaryColor)),
                          child: InkWell(
                            onTap: () {
                              showDateDialog(context);
                            },
                            child: Text(
                                ' ${widget.task.dateTime!.year}/${widget.task.dateTime!.month}/${widget.task.dateTime!.day}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: provider.isDarkMode()
                                            ? Colors.white
                                            : Color(0xFFA9A9A9))),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          height: 45,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                    const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                              ),
                              onPressed: () {
                                setState(() {
                                  editTask();
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text(
                                'Save Changes',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

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

  editTask() {
    if (formkey.currentState?.validate() == true) {
      String title = titleController.text;
      String desc = descreptionController.text;

      Task editedTask = Task(
          title: title,
          descrebtion: desc,
          dateTime: dateOnly(selectedDate),
          isDone: false,
          id: widget.task.id);
      var taskRef = MyDatabase.getTasksCollection();
      taskRef.doc(widget.task.id).update(editedTask.toFireStore());
    }
  }
}
