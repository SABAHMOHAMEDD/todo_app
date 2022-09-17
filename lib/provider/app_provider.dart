import 'package:flutter/material.dart';
import 'package:todo_app/database/my_database.dart';

import '../database/task.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang = 'en';
  List<Task> tasks = [];
  var date = DateTime.now();

  void retrieveTasks([DateTime? newDateTime = null]) async {
    if (newDateTime != null) date = newDateTime;
    var tasksQuerySnapshot = await MyDatabase.getAllTasks(date);
    tasks = tasksQuerySnapshot.docs.map((e) => e.data()).toList();
    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }

  bool isEnglish() {
    return currentLang == 'en';
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeLang(String newLang) {
    if (newLang == currentLang) return;
    currentLang = newLang;
    notifyListeners();
  }
}
