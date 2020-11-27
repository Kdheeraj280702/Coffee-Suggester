import 'package:firebaseapp/Loadingscreen.dart';
import 'package:firebaseapp/Wrapper.dart';
import 'package:firebaseapp/auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey1 = GlobalKey<FormState>();
  var _email1 = '';
  var _password1 = '';
  var errormsg = '';
  bool loading = false;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up to avail features'),
      ),
      body: (loading)? LoadingScreen():  Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Expanded(
            child: Image.asset('images/1.png'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey1,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _email1 = value.trim();
                          });
                        },
                        maxLines: 1,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            icon: Icon(
                              Icons.mail,
                              color: Colors.grey,
                            )),
                        validator: (value) =>
                            value.isEmpty ? 'Email can\'t be empty' : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _password1 = value.trim();
                            });
                          },
                          maxLines: 1,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              icon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              )),
                          validator: (value) {
                            if (value.length == 0)
                              return 'Enter password';
                            else if (value.length < 8)
                              return 'enter strong password';
                            else
                              return null;
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                      child: SizedBox(
                        height: 40.0,
                        child: SizedBox(
                          width: 250,
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formkey1.currentState.validate()) {
                                setState(()=> loading = true);
                                dynamic result = await  _auth.registerWithEmailAndPassword(_email1,_password1);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    errormsg = 'Enter valid credentials';
                                  });
                                }

                              }
                            },
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.blue,
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: new Text(
                          'Already have an account?',
                          style: new TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          errormsg,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
