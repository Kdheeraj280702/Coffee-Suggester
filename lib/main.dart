import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/auth.dart';
import 'package:firebaseapp/login.dart';
import 'package:firebaseapp/signin.dart';
import 'package:firebaseapp/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:firebaseapp/intro.dart';

import 'Wrapper.dart';
import 'home.dart';
import "signin.dart";
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        routes: {
          '/login.dart': (context) => LoginScreen(),
          '/signin.dart': (context) => SignIn(),
          '/home.dart' : (context) => Home(),
          '/intro.dart': (context) => Intro(),
        },
        home: SignIn(),
      ),
    );
  }
}
