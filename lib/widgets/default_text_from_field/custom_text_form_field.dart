import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  TextEditingController controller;
  String hintText;
  String? Function(String?)? validator;
  CustomTextFormField({required this.controller,required this.hintText,this.validator});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
       controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: validator,
    );
  }
}