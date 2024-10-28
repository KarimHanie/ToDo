import 'package:flutter/material.dart';
import 'package:to_do_app/apptheme.dart';

class TasksItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppTheme.white, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                    'play basketball',
                    style: textTheme.titleMedium?.copyWith(color: AppTheme.primary),
                  ),
                  Text(
                    'description',
                    style: textTheme.titleSmall?.copyWith(color: AppTheme.black),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: MediaQuery.sizeOf(context).height*0.05,
            width:  MediaQuery.sizeOf(context).width*0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppTheme.primary),
            child: Icon(Icons.check,color: AppTheme.white,size: 32,),
          )
        ],
      ),
    );
  }
}
