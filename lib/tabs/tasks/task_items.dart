import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/apptheme.dart';
import 'package:to_do_app/firebase_functions/firebase_functions.dart';
import 'package:to_do_app/models/task_models.dart';
import 'package:to_do_app/tabs/tasks/tasks_provider.dart';

class TasksItems extends StatelessWidget {
  TaskModel task;

  TasksItems(this.task);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: EdgeInsetsDirectional.only(end: 5),
      child: Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (_) {
              FirebaseFunctions.deleteTasks(task.id).timeout(
                Duration(microseconds: 100),
                onTimeout: () {
                  Provider.of<TaskProvider>(context, listen: false).getTasks();
                },
              ).catchError((_) {
                Fluttertoast.showToast(
                    msg: "ERROR HAPPENED",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 5,
                    backgroundColor: AppTheme.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              });
            },
            backgroundColor: AppTheme.red,
            foregroundColor: AppTheme.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          // SlidableAction(
          //   onPressed: doNothing,
          //   backgroundColor: Color(0xFF21B7CA),
          //   foregroundColor: Colors.white,
          //   icon: Icons.share,
          //   label: 'Share',
          // ),
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppTheme.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 12),
                    height: 63,
                    width: 4,
                    color: AppTheme.primary,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: textTheme.titleMedium
                            ?.copyWith(color: AppTheme.primary),
                      ),
                      Text(
                        task.description,
                        style: textTheme.titleSmall
                            ?.copyWith(color: AppTheme.black),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.05,
                width: MediaQuery.sizeOf(context).width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppTheme.primary),
                child: Icon(
                  Icons.check,
                  color: AppTheme.white,
                  size: 32,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
