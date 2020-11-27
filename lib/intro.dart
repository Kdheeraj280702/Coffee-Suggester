import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Container(
                height: 350,
                width: 350,
                child: Image(
                  image: AssetImage('images/2.png'),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text(
                'Iam your Virtual assistant '
                'You can call me Joe',
                textAlign: TextAlign.center,
                style: GoogleFonts.ptSans(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              'What should i call you?',
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                textStyle: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30,),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: TextFormField(
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          labelText: 'Your Name',
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,),
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: (){
                        Navigator.popAndPushNamed(context, '/home.dart');
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
