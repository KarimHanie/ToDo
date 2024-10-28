import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/widgets/default_text_from_field/custom_text_form_field.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextFormField(controller: titleController, hintText: 'Enter Task title'),
            CustomTextFormField(controller: descriptionController, hintText: 'Enter description'),

          ],
        ),
      ),
    );
  }
}
