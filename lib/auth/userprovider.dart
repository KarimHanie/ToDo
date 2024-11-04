import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/usermodal.dart';

class UserProvider with ChangeNotifier{
  UserModel? currentUser;

  void updateUser(UserModel? user){
    currentUser=user;
    notifyListeners();

  }

}