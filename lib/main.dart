import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.currentTheme,
      routes: {
        HomeScreen.RouteName: (_) => HomeScreen(),
        // EditTaskScreen.RouteName:(_)=> EditTaskScreen()
      },
      initialRoute: HomeScreen.RouteName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLang),
    );
  }
}