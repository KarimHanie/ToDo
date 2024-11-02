import 'package:flutter/material.dart';
import 'package:to_do_app/tabs/settings_tab.dart';
import 'package:to_do_app/tabs/tasks/add_tasls_bottom_sheet.dart';
import 'package:to_do_app/tabs/tasks/tasks_tabs.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> tabs = [TasksTabs(), SettingTab()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.zero,
          child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) => setState(() => index = value),
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    label: 'taskslist', icon: Icon(Icons.list, size: 32)),
                BottomNavigationBarItem(
                    label: 'settings', icon: Icon(Icons.settings, size: 32)),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) => AddTask(),
        ),
        child: Icon(
          Icons.add,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
