import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/apptheme.dart';
import 'package:to_do_app/home_page.dart';
import 'package:to_do_app/tabs/settings_tab.dart';
import 'package:to_do_app/tabs/tasks/tasks_tabs.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ToDoApp());
}
class ToDoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName:(_)=>HomePage(),
        Settings.routName:(_)=>Settings(),
        TasksTabs.routName:(_)=>TasksTabs(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

        
    );
  }
}