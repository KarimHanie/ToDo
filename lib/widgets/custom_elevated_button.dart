import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/apptheme.dart';

class CustomElevatedButton extends StatelessWidget {
  String label;
  VoidCallback onPressed;

  CustomElevatedButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.sizeOf(context).width, 52)),
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w400, color: AppTheme.white),
      ),
    );
  }
}
