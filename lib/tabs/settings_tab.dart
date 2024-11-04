import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/login_screen.dart';
import 'package:to_do_app/auth/userprovider.dart';
import 'package:to_do_app/firebase_functions/firebase_functions.dart';

class SettingTab extends StatelessWidget {
  static const String routName = '/settings';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LogOut',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                onPressed: () {
                  FirebaseFunctions.logout();
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  Provider.of<UserProvider>(context,listen: false).updateUser(null);
                },
                icon: Icon(
                  Icons.logout,
                  size: 28,
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
