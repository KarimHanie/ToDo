import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/apptheme.dart';
import 'package:to_do_app/firebase_functions/firebase_functions.dart';
import 'package:to_do_app/models/task_models.dart';
import 'package:to_do_app/tabs/tasks/task_items.dart';
import 'package:to_do_app/tabs/tasks/tasks_provider.dart';

class TasksTabs extends StatefulWidget {
  static const String routName = '/tasks';

  @override
  State<TasksTabs> createState() => _TasksTabsState();
}

class _TasksTabsState extends State<TasksTabs> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    if (isEmpty) {
      taskProvider.getTasks();
      isEmpty = false;
    }
    double screenHeight = MediaQuery
        .sizeOf(context)
        .height;
    // TODO: implement build
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: screenHeight * 0.15,
              width: double.infinity,
              color: AppTheme.primary,
            ),
            PositionedDirectional(
              top: 50,
              start: 20,
              child: Text(
                'ToDo List',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppTheme.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: EasyInfiniteDateTimeLine(
                showTimelineHeader: false,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                focusDate: taskProvider.selectedDate,
                lastDate: DateTime.now().add(
                  Duration(days: 365),
                ),
                onDateChange: (selectedDate) {
                  taskProvider.changeSelectedDate(selectedDate);
                  taskProvider.getTasks();
                },

                dayProps: EasyDayProps(
                  height: 79,
                  width: 58,
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(5)),
                      dayStrStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary),
                      dayNumStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary)),
                  inactiveDayStyle: DayStyle(
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(5)),
                      dayNumStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black),
                      dayStrStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black)),
                  todayStyle: DayStyle(
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(5)),
                      dayNumStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black),
                      dayStrStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black)),
                ),
              ),
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => TasksItems(taskProvider.tasks[index]),
              itemCount: taskProvider.tasks.length,
            )),
      ],
    );
  }
}
