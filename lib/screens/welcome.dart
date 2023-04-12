import 'package:annachhatra/screens/login.dart';
// import 'package:annachhatra/screens/registration.dart';
// import 'package:flutter/material.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   static const String id = 'welcome_screen';
//
//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Flexible(
//             child: Container(
//               padding: EdgeInsets.only(left: 25.0, top: 200.0, right: 14.0),
//               height: 250,
//               width: double.infinity,
//               color: Color(0xFF519259),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Anna Chatra",
//                     style: TextStyle(
//                       fontFamily: 'Montserrat',
//                         color: Colors.white,
//                         fontWeight: FontWeight.w800,
//                         fontSize: 36),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             height: 300,
//             padding: EdgeInsets.only(left: 20.0, right: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, LoginScreen.id);
//                   },
//                   child: Text(
//                     'Log In',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w800,
//                       color: Color(0xFF646464),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFFF0BB62),
//                       shape: StadiumBorder(),
//                       minimumSize: Size(double.infinity, 60)),
//                 ),
//                 SizedBox(
//                   height: 50.0,
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, RegisterScreen.id);
//                   },
//                   child: Text(
//                     'Registration',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w800,
//                       color: Color(0xFF646464),
//                     ),
//                   ),
//                   style: TextButton.styleFrom(
//                       backgroundColor: Color(0xFFF0BB62),
//                       shape: StadiumBorder(),
//                       minimumSize: Size(double.infinity, 60)),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
