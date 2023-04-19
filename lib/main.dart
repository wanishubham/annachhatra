import 'package:annachhatra/pages/home_page.dart';
import 'package:annachhatra/screens/login.dart';
import 'package:annachhatra/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // var DefaultFirebaseOptions;
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return MaterialApp(debugShowCheckedModeBanner: false,);
          }
          else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: LoginScreen.id,
              routes: {

                LoginScreen.id: (context) => LoginScreen(),
                RegisterScreen.id: (context) => RegisterScreen(),
                HomePage.id: (context) => HomePage(),

              },
            );
          }
        }
    );


  }
}


