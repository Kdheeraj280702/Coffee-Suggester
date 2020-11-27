

import 'package:firebaseapp/intro.dart';
import 'package:firebaseapp/login.dart';
import 'package:firebaseapp/user.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var user = Provider.of<User>(context);
    print(user);
    bool introDone = false;
    // return either the Home or Authenticate widget
    if (user == null){
      return LoginScreen();
    } else if (introDone){
      return Intro();

    }
    else return Home();
  }
}