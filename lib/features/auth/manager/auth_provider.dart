
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/remote/firebase_functions.dart';
import 'package:todo_app/models/user_model.dart';

class AuthPageProvider extends ChangeNotifier{
  UserModel? userModel;
  User? firebaseUser;

  AuthPageProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }
  initUser() async{
    userModel = await FirebaseFunctions.readUser();
    notifyListeners();
  }

  logout() async{
    await FirebaseAuth.instance.signOut();
    userModel = null;
    firebaseUser = null;
    notifyListeners();
  }
}