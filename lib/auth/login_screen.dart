import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/register_screen.dart';
import 'package:to_do_app/auth/userprovider.dart';
import 'package:to_do_app/home_page.dart';
import 'package:to_do_app/widgets/custom_elevated_button.dart';
import 'package:to_do_app/widgets/default_text_from_field/custom_text_form_field.dart';

import '../apptheme.dart';
import '../firebase_functions/firebase_functions.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                isPassword: false,
                controller: emailController,
                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.trim().length < 5) {
                    return 'email is less than 5 ';
                  } else
                    return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                  isPassword: true,
                  controller: passwordController,
                  hintText: 'Password',
                  validator: (value) {
                    if (value == null || value.trim().length < 8) {
                      return 'please enter password bigger than 8';
                    } else
                      return null;
                  }),
              SizedBox(height: 32),
              CustomElevatedButton(label: 'Login', onPressed: login),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RegisterScreen.routeName);
                  },
                  child: Text('dont have an account?')),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (formkey.currentState!.validate()) {
      FirebaseFunctions.login(
              email: emailController.text, password: passwordController.text)
          .then(
        (user) {
          Provider.of<UserProvider>(context, listen: false).updateUser(user);
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        },
      ).catchError((error) {
        String? message;
        if (error is FirebaseAuthException) {
          message = error.message;
        }
        Fluttertoast.showToast(
            msg: message ?? "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 5,
            backgroundColor: AppTheme.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
    // Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}
