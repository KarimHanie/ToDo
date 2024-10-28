import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  TextEditingController controller;
  String hintText;
  CustomTextFormField({required this.controller,required this.hintText});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
       controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}