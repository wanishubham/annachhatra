import 'package:annachhatra/screens/login.dart';
import 'package:annachhatra/side_menu/donation.dart';
import 'package:annachhatra/side_menu/pick_ups.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            DrawerHeader(child: Row(children:[Container(padding:EdgeInsets.only(top: 100,left: 10),
            child:
            Text('Vishal more',style:GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Color(0xFFFFFFFF)),),),),]),
      decoration: BoxDecoration(color: Color(0xFFF0BB62),),),
       ListTile(
         contentPadding: EdgeInsets.only(left: 24),
        title: Text('View Donation',style:GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w500,color: Color(0xFF646464),fontSize: 16),),),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Donation()));
        }),
          ListTile(
            contentPadding: EdgeInsets.only(left: 24),
            leading: Text('Pick up Orders',style: GoogleFonts.montserrat(textStyle:TextStyle(fontWeight: FontWeight.w500,color: Color(0xFF646464),fontSize: 16),),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PickUp()));
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 24),
            leading: Image.asset('images/Vector.png'),
            title: Text('Log Out',textAlign: TextAlign.start,style: GoogleFonts.montserrat(textStyle:TextStyle(fontWeight: FontWeight.w500,color: Color(0xFF646464),fontSize: 16),),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
          ),

        ],
      ),
    );
  }
}
