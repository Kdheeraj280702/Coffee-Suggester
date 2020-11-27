
import 'package:firebaseapp/auth.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome home'),
          actions: <Widget>[
            FlatButton(
              child: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
              ],
            ),


      ),
    );
  }
}
