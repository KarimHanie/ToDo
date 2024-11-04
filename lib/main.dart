import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/apptheme.dart';
import 'package:to_do_app/auth/login_screen.dart';
import 'package:to_do_app/auth/register_screen.dart';
import 'package:to_do_app/auth/userprovider.dart';
import 'package:to_do_app/home_page.dart';
import 'package:to_do_app/tabs/settings_tab.dart';
import 'package:to_do_app/tabs/tasks/tasks_provider.dart';
import 'package:to_do_app/tabs/tasks/tasks_tabs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: ToDoApp(),
  ));
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SettingTab.routName: (_) => SettingTab(),
        TasksTabs.routName: (_) => TasksTabs(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen()
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
