import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/apptheme.dart';
import 'package:to_do_app/firebase_functions/firebase_functions.dart';
import 'package:to_do_app/tabs/tasks/tasks_provider.dart';
import 'package:to_do_app/widgets/custom_elevated_button.dart';
import 'package:to_do_app/widgets/default_text_from_field/custom_text_form_field.dart';

import '../../models/task_models.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextStyle? titleMeduimStyle = Theme
        .of(context)
        .textTheme
        .titleMedium;
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery
          .of(context)
          .viewInsets
          .bottom),
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery
            .sizeOf(context)
            .height * 0.5,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "add new task",
                style: titleMeduimStyle,
              ),
              CustomTextFormField(
                controller: titleController,
                hintText: 'Enter Task title',
                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'title cannont be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                controller: descriptionController,
                hintText: 'Enter description',
                validator: (value) {
                  value?.trim();
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'description cannot tbe empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('select Date',
                  style:
                  titleMeduimStyle?.copyWith(fontWeight: FontWeight.w400)),
              SizedBox(height: 9),
              InkWell(
                  onTap: () async {
                    DateTime? dateTime = await showDatePicker(
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (dateTime != null) {
                      selectedDate = dateTime;
                      setState(() {});
                    }
                  },
                  child: Text('${dateFormat.format(selectedDate)}')),
              SizedBox(height: 25),
              CustomElevatedButton(
                  label: 'Add',
                  onPressed: () {
                    if (formKey.currentState!.validate()) addTask();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void addTask() {
    TaskModel task = TaskModel(
      title: titleController.text,
      description: descriptionController.text,
      date: selectedDate,
    );
    FirebaseFunctions.addTaskToFireBase(task)
        .timeout(Duration(microseconds: 100),
        onTimeout: ()
        {
          Navigator.of(context).pop();
          Provider.of<TaskProvider>(context, listen: false).getTasks();
          Fluttertoast.showToast(
              msg: "TASK ADDED SUCCESSFULLY",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 5,
              backgroundColor: AppTheme.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
        })
        .catchError((error) {
      Fluttertoast.showToast(
          msg: "ERROR HAPPENED",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: AppTheme.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }
}
