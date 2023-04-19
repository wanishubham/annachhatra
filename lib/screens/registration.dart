//import 'dart:html';
import 'dart:io';

import 'package:annachhatra/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  CollectionReference users  = FirebaseFirestore.instance.collection('users');

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String username;
  late String address;
  late String email;
  late String password;
  late String verify;
  //String? profile;
  late String imageUrl;

 // late String fileName;

  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,

    );
    Reference ref = FirebaseStorage.instance.ref().child('demo.jpg');
    UploadTask uploadTask = ref.putFile(File(image!.path));

    uploadTask.whenComplete(()  async{

      try{
        imageUrl = await ref.getDownloadURL();

      }catch(e){
        print(e);
      }
      print(imageUrl);
    });

    //await
    // ref.getDownloadURL().then((value) => print(value));
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child:Column(
        children: <Widget>[
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 25.0, top: 65.0, right: 14.0),
                height: 120,
                width: double.infinity,
                color: Color(0xFF519259),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Anna Chatra",
                      style: GoogleFonts.montserrat(textStyle:TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 36),
                    )
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
                height: 70,
                padding: EdgeInsets.only(top: 5, left: 25, right: 14),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registration",
                      style: GoogleFonts.montserrat(textStyle:TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF519259),
                          fontWeight: FontWeight.bold,
                          fontSize: 36),
                    ),),
                  ],
                )),
          ),
          Flexible(child: GestureDetector(
    onTap: (){
      pickUploadImage();
      print('image stored'+imageUrl.toString());

    },

          child:
           Container(
              height: 136,
              width: 185,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),),
          SizedBox(height: 35.0),
          SingleChildScrollView(
              child: Container(
            width: double.infinity,
            // height: 350,
            padding: EdgeInsets.only(left: 28, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    username = value;
                  },
                  decoration:
                      InputDecoration(hintText: 'Organization / hotel name'),
                ),
                TextField(
                  keyboardType: TextInputType.streetAddress,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    address=value;
                  },
                  decoration: InputDecoration(hintText: 'Address'),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(hintText: 'e-mail'),
                ),
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(hintText: 'password'),
                ),
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    verify = value;
                  },
                  decoration: InputDecoration(hintText: 'verify password'),
                ),
              ],
            ),
          )),
          SizedBox(
            height: 31.0,
          ),
          Flexible(
              child: Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async{
                    await users.add({'username': username,'profile': imageUrl.toString()}).then((value) => print('User added' ));

                    setState(() {
                      showSpinner = true;
                    });
                    try{
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if(newUser != null){
                        Navigator.pushNamed(context, HomePage.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    }
                    catch(e){
                      print(e);
                    }
                  },
                  child: Text(
                    'Register',
                    style: GoogleFonts.montserrat(textStyle:TextStyle(fontWeight:FontWeight.w800,fontFamily: 'Montserrat',color: Color(0xFF646464)),
                  ),),
                  style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color(0xFFF0BB62),
                      minimumSize: Size(182, 39.25)),
                )
              ],
            ),
          )),
        ],
      ),
    ),
    );
  }
}
