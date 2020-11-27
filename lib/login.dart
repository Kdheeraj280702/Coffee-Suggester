
import 'package:firebaseapp/auth.dart';
import 'package:firebaseapp/main.dart';
import 'package:flutter/material.dart';
import 'Loadingscreen.dart';
import 'auth.dart';


class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var err  ='';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to avail features'),
      ),
      body:(loading)? LoadingScreen() : Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Container(
            height: 250,
            width: 250,
            child: Image.asset('images/1.png'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            _email = value.trim();
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
                        onChanged: (value){
                          setState(() {
                            _password = value.trim();
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
                        validator: (value){
                          if(value.length==0) return 'Enter password';
                          else  if(value.length<8) return 'enter strong password';
                          else return null;
                        }

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                      child: SizedBox(
                        height: 40.0,
                        child: SizedBox(
                          width: 250,
                          child: RaisedButton(
                            onPressed: () async {
                              if(_formkey.currentState.validate()){
                                setState(() => loading = true);
                               dynamic result = AuthService().loginInWithEmailPassword(_email, _password);
                               if(result==null)
                                { setState(() {
                                   err = 'Email and Password didnt match';
                                   loading = false;
                                 });
                              }}
                            },
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.blue,
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){
                             Navigator.pushNamed(context, '/signin.dart');

                        },
                        child: new Text(
                          'Create an account',
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300,color: Colors.blue),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          err,
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
