import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {required this.controller,
        required this.hintText,
        this.validator,
        this.isPassword=false
  });
  TextEditingController controller;
  String hintText;
  String? Function(String?)? validator;
  bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObsecure=widget.isPassword;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObsecure= !isObsecure;
                  setState(() {

                  });
                },
                icon: Icon(Icons.visibility_off_outlined),
              )
            : null,
      ),
      validator: widget.validator,
      obscureText: isObsecure,
    );
  }
}
