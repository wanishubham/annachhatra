import 'package:annachhatra/pages/home_page.dart';
import 'package:annachhatra/screens/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  color: Color(0xFF519259),
                  height: 250.0,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 19.0, top: 200.0),

                  // child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: <Widget>[
                  child: Text(
                    'Anna Chatra',
                    style: GoogleFonts.montserrat(textStyle:TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        fontSize: 36.0,
                        color: Colors.white),
                  )
                  // ],
                  ),),

              Container(
                height: 400.0,
                width: double.infinity,
                color: Colors.white,
                // padding: EdgeInsets,
                padding: EdgeInsets.only(top: 10.0, left: 19.0, right: 19.0),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log In',
                      style: GoogleFonts.montserrat(textStyle:TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 36.0,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF519259)),
                    ),),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(hintText: 'e-mail'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'password',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              //padding: EdgeInsets.only(top:15.0,left: 234.0,),
                              child: Text(
                            'Not Registerd?',
                            style: GoogleFonts.montserrat(textStyle:TextStyle(
                                color: Color(0xFF4ABEFF),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          )),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10.0,
              ),

              //
              Container(
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {

                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, HomePage.id);
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        style: TextButton.styleFrom(
                            shape: StadiumBorder(),
                            minimumSize: Size(182, 39.25),
                            backgroundColor: Color(0xFFF0BB62),
                            padding: EdgeInsets.only(left: 30.0)),
                        child: Text(
                          'Log In',textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(textStyle:TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF646464)),
                        ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
